from flask import jsonify, request
from bpo_api import db, app
from bpo_api.models import Operator
from flask import Flask, Response, render_template
from sqlalchemy import *
import pymssql
import json
import copy
import itertools

import ldap3
import jwt
import datetime



@app.route('/', methods=['POST'])
def login():
    #Parameters
    try:
        username= request.form['username']
        password= request.form['password']
    except:
        username = request.json.get('username')
        password = request.json.get('password')

    LDAP_URI = 'lbdc.wvrgroup.internal'
    HA_USERNAME = 'wvrgroup\\{0}'.format(username)
    HA_PASSWORD = password
    valid_groups = ['IS-Decision Systems','IS-Data Insights','IS-Contractors','IS-Database Engineering','HAAnalyticsEng']
    
    #Send request to AD
    try:
        server = ldap3.Server(LDAP_URI,get_info=ldap3.ALL)
        conn = ldap3.Connection(server, HA_USERNAME, HA_PASSWORD, True)
        print('User authenticated in AD: {0}'.format(conn.extend.standard.who_am_i()))
    except ldap3.core.exceptions.LDAPBindError as bind_error:
        print(str(bind_error))
        return jsonify(flag='fail', msg=str(bind_error)),401
    except ldap3.core.exceptions.LDAPPasswordIsMandatoryError as pwd_mandatory_error:
        print(str(pwd_mandatory_error))
        return jsonify(flag='fail', msg=str(pwd_mandatory_error)),401

    #filter for username
    ad_filter= '(&(sAMAccountType=805306368)(sAMAccountName='+username+'))'
    conn.search('dc=wvrgroup,dc=internal', ad_filter)
    person = conn.entries

    #Get user's groups
    fq_persons = [result.entry_dn for result in person]
    my_groups = []
    for person in fq_persons:
        conn.search(person, '(objectclass=person)', attributes=['memberOf'])
        if 'memberOf' in conn.entries[0]:
            list_of_groups = conn.entries[0]['memberOf'].values
            for listgr in list_of_groups:
                conn.search(listgr,'(objectclass=group)', attributes =['cn'])
                if 'cn' in conn.entries[0]:
                    ind_groups = conn.entries[0]['cn'].values[0]
                    my_groups.append(ind_groups)

    #Validate if user's group is in valid_groups list, generate token
    for group in my_groups:
        if group in valid_groups:
            token = jwt.encode({'username' : username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, app.config['SECRET_KEY'])
            print("User is in a valid group and can access Audatar")
            return jsonify(flag='pass', token=token.decode('ascii'),  msg='Welcome '+username)
    
    print("User is not in a valid group and can't access Audatar")
    return jsonify(flag='fail', msg='Sorry, not in a valid group: '+username), 401



@app.route("/validate", methods=["POST"])
def validate_querys():

    try:
        pass_condition=request.form['condition']
        print(pass_condition)
    except Exception as e:
        print(str(e))

    connectionStringUAC = 'mysql+pymysql://secret:secret@S@assmysql010/bd'
    connectionStringUACdev = 'mysql+pymysql://secret:secret@S@uacdev001/bd'
    connectionStringSQL = 'mssql+pymssql://secret:secret@server/dw'
    
    if(request.form['conn1']=="connectionStringUACdev"):
        try:
            engine = create_engine(connectionStringUACdev)
        except Exception as e:
            print(str(e))
    elif(request.form['conn1']=="connectionStringSQL"):
        try:
            engine = create_engine(connectionStringSQL)
        except Exception as e:
            print(str(e))
    else:
        try:
            engine = create_engine(connectionStringUAC)
        except Exception as e:
            print(str(e))


    if(request.form['conn2']=="connectionStringUACdev"):
        try:
            engine2 = create_engine(connectionStringUACdev)
        except Exception as e:
            print(str(e))
    elif(request.form['conn2']=="connectionStringSQL"):
        try:
            engine2 = create_engine(connectionStringSQL)
        except Exception as e:
            print(str(e))
    else:
        try:
            engine2 = create_engine(connectionStringUAC)
        except Exception as e:
            print(str(e))

    #Query 1
    connection = engine.connect()
    sql1 = text(request.form['query1'])
    try:
        results1 = connection.execute(sql1)
    except Exception as e:
        print(str(e))
    column_names1 = results1.keys()
    data1 = results1.fetchall()
    result1 = [dict(zip(column_names1, row)) for row in data1]
    connection.close()

    #Query 2
    connection2 = engine2.connect()
    sql2 = text(request.form['query2'])
    try:
        results2 = connection2.execute(sql2)
    except Exception as e:
        print(str(e))
    column_names2 = results2.keys()
    data2 = results2.fetchall()
    result2 = [dict(zip(column_names2, row)) for row in data2]
    connection2.close()

    query1_key= request.form['key1']
    query2_key= request.form['key2']

    print("column names 1")
    print(column_names1)

    if query1_key not in column_names1:
        print("key1 not in column_names")

    if query2_key not in column_names2:
        print("key2 not in column_names2")

    if not(query1_key==query2_key):
        for item in result2:
                item[query1_key] = item.pop(query2_key)
        for n,i in enumerate(column_names2):
            print(i)
            if i==query2_key:
                print("change")
                column_names2[n]=query1_key
        query2_key=query1_key

    temp2 = [x for x in column_names1 if x not in set(column_names2)]
    if temp2:
        return jsonify({"Message" : "no same columns"}),404


    #return jsonify({"Message" : "ok"})
    

    #compare data - START OF VALIDATIONS
    
    intersec = [item for item in result1 if item in result2]
    sym_diff = [item for item in itertools.chain(result1,result2) if item not in intersec]
    
    print("sym diff")
    print(sym_diff)
    #list of different keys
    list_to_convert=[]
    for index,dict1 in enumerate(sym_diff):
        for key in dict1:
            if(key==query1_key  or key == query2_key):
                list_to_convert.append(dict1[key])
    column_names = set().union(*(d.keys() for d in sym_diff))
    #col2=list(sym_diff[0].keys())
    print(column_names)

    #final list of different keys
    list_final = list(set(list_to_convert))
    print(list_final)
    #comparisson type
    #"Query 1 and Query 2 data is the same for all rows that join in both queries" = join
    final_list=[]
    for ind,value in enumerate(list_final):
        new_dict={}
        new_dict["key"]= value
        flag1=False
        flag2=False
        print(new_dict)
        for col in column_names:
            if not (col==query1_key):
                
                #Data 1
                new_value=None
                new_dict2={}
                new_key="query1_"+col 
                #print (new_key)
                for index,dict1 in enumerate(result1):
                    if(dict1 not in intersec):
                        if(dict1.get(query1_key)==value):
                            for key in dict1:
                                if(key==col ):
                                    new_value= dict1[key]
                                    flag1=True
                new_dict2[new_key]=new_value
                new_dict.update(new_dict2)
                print("after data1")
                print(new_dict)
                #Data 2
                new_value=None
                new_dict2={}
                new_key="query2_"+col
                #print (new_key)
                for index,dict2 in enumerate(result2):
                    if(dict2 not in intersec):
                        if(dict2.get(query2_key)==value):
                            for key in dict2:
                                if(key==col ):
                                    new_value= dict2[key]
                                    flag2=True
                new_dict2[new_key]=new_value
                new_dict.update(new_dict2)
                print("after data1")
                print(new_dict)
        if(pass_condition=="join"):
            if(flag1==True and flag2 == True):
                final_list.append(new_dict)
                print("inside condition join")
                print(new_dict)
        else:
            print("not inside condition join")
            print(new_dict)
            final_list.append(new_dict)

    '''
    try:
        temp3 = [item for item in result1 if item not in result2]
    except Exception as e:
        print(str(e))
    '''

    print("aca2")
    print(final_list)
    if final_list:
        #print("printing temp3")
        print(sym_diff)
        try:
            return json.dumps(final_list),    201
        except Exception as e:
            print(str(e))

        '''
        try:
            return jsonify(temp3),    201
        except Exception as e:
            print(str(e))'''
    else:
        return jsonify({"Message" : "They match!"}),201


@app.route("/operator/<string:id_operator>/", methods=["GET"])
def get_operator(id_operator):
    #x = Operator.query.get(id_operator)

    x = Operator.query.filter(Operator.id_operator==id_operator).first()

    if x:
        print("exists")
        return jsonify({
            "item": {"id_operator": x.id_operator, "des_operator": x.des_operator, "team": x.id_team}
        }), 200
    else:
        print("not exists")
        return jsonify({
            "item": {"Message": id_operator +  " not found!"}
        }), 404



@app.route("/operator", methods=["POST"])
def new_operator():

    x = Operator.query.filter(Operator.id_operator==request.form['id_operator']).first()
    if x:
        return "This operator already exists!"
    else:
        new_operator = Operator()
        new_operator.id_operator = request.form['id_operator']
        new_operator.id_team  = request.form['id_team']
        new_operator.des_operator = request.form['des_operator']

        try:
            db.session.add(new_operator)
        except Exception as e:
            print(str(e))
        db.session.commit()

        return "New Operator inserted: " + request.form['des_operator']
        #return jsonify({"id_operator": new_operator.id_operator}), 201


'''
#only API
@app.route("/operator", methods=["POST"])
def new_operator():
    json = request.get_json()
    id_operator = json.get("id_operator")
    id_team = json.get("id_team")
    des_operator = json.get("des_operator")
    print("en el post")
    new_operator = Operator()
    new_operator.id_operator = id_operator
    new_operator.id_team  = id_team
    new_operator.des_operator = des_operator
    print(new_operator.id_team)

    try:
        db.session.add(new_operator)
    except Exception as e:
        print(str(e))
    db.session.commit()
    return jsonify({"id_operator": new_operator.id_operator}), 201







@app.route("/product", methods=["POST"])
def new_product():
    json = request.get_json()
    name = json.get("name")
    description = json.get("description")
    category = json.get("category")
    price = json.get("price")
    new_product = Product()
    new_product.name = name
    new_product.description = description
    new_product.category = category
    new_product.price = price
    db.session.add(new_product)
    db.session.commit()
    return jsonify({"id": new_product.id}), 201

@app.route("/product", methods=["GET"])
def list_product():
    category = request.args.get('category')
    if category:
        x = Product.query.filter(Product.category == category).all()
        items = []
        for item in x:
            items.append(
                {"id": item.id, "name": item.name, "description": item.description, "category": item.category, "price": item.price }
            )
        return jsonify({
            "items": [items]
        }), 200
    else:
        product = Product.query.order_by(Product.id).all()
        return jsonify({
            "items": [{"id": x.id, "name": x.name, "description": x.description, "category": x.category, "price": x.price} for x in product]
        }), 200

@app.route("/product/<int:id>/", methods=["GET"])
def get_product(id):
    x = Product.query.get(id)
    return jsonify({
        "item": {"id": x.id, "name": x.name, "description": x.description, "category": x.category, "price": x.price}
    }), 200



@app.route("/product/<int:id>", methods = ['PUT'])
def update_product(id):
    x = Product.query.get(id)
    x.name = request.json.get('name', x.name)
    x.description = request.json.get('description', x.description)
    x.category = request.json.get('category', x.category)
    x.price = request.json.get('price', x.price)
    db.session.commit()
    return jsonify({
        "item": {"id": x.id, "name": x.name, "description": x.description, "category": x.category, "price": x.price}
    }), 200

@app.route("/product/<int:id>", methods = ['DELETE'])
def delete_product(id):
    db.session.delete(Product.query.get(id))
    db.session.commit()
    return jsonify( { 'result': True, "Status": 'Product succesfully deleted' } ), 200

@app.route("/product/<string:name>/", methods=["GET"])
def get_product_byname(name):
    x = Product.query.filter(Product.name==name).first()
    return jsonify({
        "item": {"id": x.id, "name": x.name, "description": x.description, "category": x.category, "price": x.price}
    }), 200

@app.route("/product/<string:name>", methods=["PUT"])
def update_product_byname(name):
    x = Product.query.filter(Product.name==name).first()
    x.name = request.json.get('name', x.name)
    x.description = request.json.get('description', x.description)
    x.category = request.json.get('category', x.category)
    x.price = request.json.get('price', x.price)
    db.session.commit()
    return jsonify({
        "item": {"id": x.id, "name": x.name, "description": x.description, "category": x.category, "price": x.price}
    }), 200

@app.route("/product/<string:name>/", methods=["DELETE"])
def delete_product_byname(name):
    db.session.delete(Product.query.filter(Product.name == name).first())
    db.session.commit()
    return jsonify( { 'result': True, "Status": 'Product succesfully deleted' } ), 200
'''

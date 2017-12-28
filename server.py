from bpo_api import db, app, controllers
from flask import Flask, Response, request, render_template, make_response,jsonify, session, flash
import jwt
import datetime
from functools import wraps

app.config['SECRET_KEY'] = 'thisisthesecretkey'
'''
@app.route("/")
def welcome_to_home():
    #return "Welcome to BPO BI page"
    return render_template('login.html')
'''
@app.route('/')
def login2():
    error = None
    '''if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            session['logged_in'] = True
            token = jwt.encode({'user' : request.form['username'], 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, app.config['SECRET_KEY'])
            session['token']= token.decode('UTF-8')
            flash('Logged in')
            print(session['token'])
            print("se logueó")
            return render_template('new_operator.html')'''
    return render_template('login.html', error=error)



@app.route("/validator")
def validation():
    return render_template('validator.html')

@app.route("/newoperator")
def new_operator_html():
    return render_template('new_operator.html')

@app.route("/echo", methods=['POST'])
def echo():
    return "You said: " + request.form['des_operator']



def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        print("getting token")
        token = request.args.get('token')
        print(token)
        if not token:
            return jsonify({'message': 'token is missing'}) , 403

        try:
            data = jwt.decode(token,app.config['SECRET_KEY'])
        except:
            return jsonify({'message': 'token is invalid'}) , 403

        return f(*args, **kwargs)
    return decorated

@app.route("/unprotected")
def unprotected():
    return jsonify({'message': 'Anyone can view this'})

@app.route("/protected")
@token_required
def protected():
    return jsonify({'message': 'this is only available for people with valid tokens'}) 


'''
@app.route("/login")
def login():
    auth = request.authorization
    if auth and auth.password == 'password':
        token = jwt.encode({'user' : auth.username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, app.config['SECRET_KEY'])
        return jsonify({'token' : token.decode('UTF-8')})
    return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Login Required"'})
'''


if __name__ == "__main__":
    #db.create_all()
    app.run(port=3000, host="localhost")

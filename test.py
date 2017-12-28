import itertools, collections
'''
data1 = [{'state': 'Delaware', 'revenue': 150, 'num_stores': 5},
{'state': 'California', 'revenue': 100, 'num_stores': 8}
]

data2 = [{'state2': 'Delaware', 'revenue': 150, 'num_stores': 5},
{'state2': 'California', 'revenue': 100, 'num_stores': 8}]

'''
data1 = [{'state': 'Alabama', 'revenue': 100, 'num_stores': 5},
{'state': 'California', 'revenue': 200, 'num_stores': 8},
{'state': 'Delaware', 'revenue': 150, 'num_stores': 5},
{'state': 'Oklahoma', 'revenue': 80, 'num_stores': 3},
{'state': 'Texas', 'revenue': 180, 'num_stores': 7},
{'state': 'Virginia', 'revenue': 30, 'num_stores': 1}]

data2 = [{'state2': 'California', 'revenue': 200, 'num_stores': 8},
{'state2': 'Delaware', 'revenue': 150, 'num_stores': 4},
{'state2': 'Georgia', 'revenue': 120, 'num_stores': 4},
{'state2': 'Oklahoma', 'revenue': 80, 'num_stores': 3},
{'state2': 'Texas', 'revenue': 170, 'num_stores': 7},
{'state2': 'Vermont', 'revenue': 40, 'num_stores': 1},
{'state2': 'Virginia', 'revenue': 30, 'num_stores': 1}]



query1_key = "state"
query2_key = "state2"

'''
data1 = [{'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_Bookings_LDMF_QuoteFact', 'ActiveFlag': False},
 {'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LeadCounts', 'ActiveFlag': False},
 {'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LMF_VS_Inquiry_ValidInquiry', 'ActiveFlag': False},
 {'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LMF_VS_LDMF_NativePageViews', 'ActiveFlag': False},
 {'ValidationClass': 'MA', 'ProcedureName': 'PR_VLD_EloquaConfirmRecordLoad', 'ActiveFlag': False},
 {'ValidationClass': 'CSDW', 'ProcedureName': 'PR_VLD_ContactualValidateStageLoad', 'ActiveFlag': True},
 {'ValidationClass': 'INVOICE_PAYMENT', 'ProcedureName': 'dw.dbo.PR_VLD_LoadLeads', 'ActiveFlag': True},
 {'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_HeartbeatBaseCheck', 'ActiveFlag': False},
 {'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_HeartbeatDeviationCheck', 'ActiveFlag': False}]
data2 = [{'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_Bookings_LDMF_QuoteFact', 'ActiveFlag': True},
{'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LeadCounts', 'ActiveFlag': False},
{'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LMF_VS_Inquiry_ValidInquiry', 'ActiveFlag': True},
{'ValidationClass': 'DW', 'ProcedureName': 'PR_VLD_LMF_VS_LDMF_NativePageViews', 'ActiveFlag': True},
{'ValidationClass': 'MA', 'ProcedureName': 'PR_VLD_EloquaConfirmRecordLoad', 'ActiveFlag': False},
{'ValidationClass': 'CSDW', 'ProcedureName': 'PR_VLD_ContactualValidateStageLoad', 'ActiveFlag': True},
{'ValidationClass': 'DW_Facts', 'ProcedureName': 'PR_VLD_HeartbeatBaseCheck', 'ActiveFlag': False},
{'ValidationClass': 'DW_Facts', 'ProcedureName': 'PR_VLD_HeartbeatDeviationCheck', 'ActiveFlag': False},
{'ValidationClass': 'DW_Facts', 'ProcedureName': 'PR_VLD_HeartbeatUndefined', 'ActiveFlag': False},
{'ValidationClass': 'Listings', 'ProcedureName': 'PR_VLD_CheckDupeListingDueToStayzMigration', 'ActiveFlag': True}]
query1_key = "ProcedureName"
query2_key = "ProcedureName"

'''





#find duplicates by key
all_key_values1=[]
counter_list1=[]
all_key_values2=[]
counter_list2=[]

for item in data2:
    item[query1_key] = item.pop(query2_key)
query2_key=query1_key

#Set number of records by key
for element in data1:
    new_dict4={}
    all_key_values1.append(element[query1_key])
    key_elements = [k[query1_key] for k in data1 if k.get(query1_key) and k.get(query1_key)==element[query1_key]]
    new_dict4[element[query1_key]]= len(key_elements)
    counter_list1.append(new_dict4)
records_by_key1=[dict(t) for t in set([tuple(d.items()) for d in counter_list1])]

#Set number of records by key
for element in data2:
    new_dict4={}

    all_key_values2.append(element[query2_key])
    key_elements = [k[query2_key] for k in data2 if k.get(query2_key) and k.get(query2_key)==element[query2_key]]
    new_dict4[element[query2_key]]= len(key_elements)
    counter_list2.append(new_dict4)
records_by_key2=[dict(t) for t in set([tuple(d.items()) for d in counter_list2])]


#Records that match
intersec2 = [item for item in all_key_values1 if item in all_key_values2]

#Find count by key that does not match
for item in intersec2:
    for index,dict1 in enumerate(records_by_key1): 
        if(item in dict1.keys()):
            comp1=dict1.get(item)
    for index,dict2 in enumerate(records_by_key2): 
        if(item in dict2.keys()):
            comp2=dict2.get(item)
    if not (comp1==comp2):
        print("Count by key does not match.")




#intersec = [item for item in clean1 if item in clean2]
#sym_diff = [item for item in itertools.chain(clean1,clean2) if item not in intersec]
#print(intersec)
#print(sym_diff)

#key_elements = [k[query1_key] for k in data2 if k.get(query1_key) and k.get(query1_key)=="California" ]
#print(len(key_elements))


intersec = [item for item in data1 if item in data2]
sym_diff = [item for item in itertools.chain(data1,data2) if item not in intersec]

if not sym_diff:
    print("they match")
#list of different keys
list_to_convert=[]
for index,dict1 in enumerate(sym_diff):
    for key in dict1:
        if(key==query1_key or key == query2_key):
            list_to_convert.append(dict1[key])
column_names = set().union(*(d.keys() for d in sym_diff))
#col2=list(sym_diff[0].keys())


#final list of different keys
list_final = list(set(list_to_convert))

#comparisson type
pass_condition=1

final_list=[]
order_list=[]
order_list.append("key")
for ind,value in enumerate(list_final):
    new_dict={}
    new_dict["key"]= value
    flag1=False
    flag2=False
    for col in column_names:
        if not (col==query1_key or col==query2_key):

            #Data 1
            new_value="None"
            new_dict2={}
            new_key="query1_"+col
            if not(new_key in order_list):
                order_list.append(new_key)
            #print (new_key)
            #print(order)
            for index,dict1 in enumerate(data1):
                if(dict1 not in intersec):
                    if(dict1.get(query1_key)==value):
                        for key in dict1:
                            if(key==col ):
                                new_value= str(dict1[key])
                                flag1=True
            new_dict2[new_key]=new_value
            new_dict.update(new_dict2)

            #Data 2
            new_value="None"
            new_dict2={}
            new_key="query2_"+col
            if not(new_key in order_list):
                order_list.append(new_key)
            #print (new_key)
            #print(order)
            for index,dict2 in enumerate(data2):
                if(dict2 not in intersec):
                    if(dict2.get(query2_key)==value):
                        for key in dict2:
                            if(key==col ):
                                new_value= str(dict2[key])
                                flag2=True
            new_dict2[new_key]=new_value
            new_dict.update(new_dict2)

    if(pass_condition==1):
        if(flag1==True and flag2 == True):
            final_list.append(new_dict)

    else:
        final_list.append(new_dict)
        #print(new_dict)


print(order_list)
print(final_list)

#print (intersec)
#print(sym_diff)
# print(d)

#keys = [k for k in  a[0].keys()]
#print(keys)

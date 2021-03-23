#!/usr/bin/env python3

import json
import os
import MySQLdb
import decimal
from decimal import Decimal
import datetime

def Decoder(o):
    if isinstance(o, datetime.datetime):
        return str(o)
    if isinstance(o, decimal.Decimal):
        return o.__str__()

year = '2020'
month = '08'

HOST = 'ds3002-rds.cqee4iwdcaph.us-east-1.rds.amazonaws.com'
USER = 'ds3002'
PASS = os.environ.get('RDS_PASS')
db=MySQLdb.connect(host=HOST,user=USER,passwd=PASS,db="ds3002")

def get_tracking(year: int, month: int):
    query = f"SELECT * FROM tracking WHERE created_on LIKE '{year}-{month}-%';"
    c=db.cursor()
    c.execute(query)
    headers=[x[0] for x in c.description]
    results = c.fetchall()
    json_data=[]
    for result in results:
        json_data.append(dict(zip(headers,result)))
    output = json.dumps(json_data, default = Decoder)
    print(output)
    return output
 
get_tracking(year,month)
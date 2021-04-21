#!/usr/bin/env python3

from pymongo import MongoClient, errors
import prettyprint as pprint
import os

mongopass = os.getenv('MONGOPASS')
uri = "mongodb+srv://cluster0.pguxs.mongodb.net/sample_restaurants"
client = MongoClient(uri, username='mongo', password=mongopass, connectTimeoutMS=200, retryWrites=True)

stats = client.stats
print(stats)

dbs = client.list_database_names()
print(dbs)

thisdb = client.sample_restaurants
colls = thisdb.list_collection_names()
print(colls)

restaurants = thisdb.restaurants
count = restaurants.count_documents({})
print(count)

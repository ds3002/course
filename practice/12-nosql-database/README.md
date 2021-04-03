# NoSQL Databases

We will touch three NoSQL database systems in this section of the course:

1. [**Redis**](#redis) - an in-memory Key-Value database.
2. [**MongoDB**](#mongodb) - a popular document database.
3. [**DynamoDB**](#dynamodb) - Amazon's cloud-based NoSQL service that offers both key-value and document features.

## Redis

Think of Redis as an exceptionally fast, 2-column lookup table. It makes no use of schemas, relations, or indexes.

- The LEFT `key` column (metaphorically speaking) in a Redis DB stores keys. Keys can consist of any useful, unique, identifier.
- The RIGHT `value` column in a Redis DB can consist of a variety of data types, such as strings, integers, lists, sets, hash tables, etc.

![Redis Data Types](https://keestalkstech.com/wp-content/uploads/2019/04/redis-data-structure-types1.jpeg)

Redis is "fast" despite its data storage capabilities being relatively large (the `value` half has a maximum capacity of 512MB),
while the database engine attempts to keep frequently-access data in memory for optimal return to requests.

Redis's strongest features for data science are:

1. Incredibly simple to use.
2. Stores large records.
3. Returns results quickly.
4. Useful for storing and retrieving lists, queues, tasks, items, orchestration, settings, etc.

[**Learn more about Redis**](https://redis.io/)

### Run Redis & Connect

For practice you will run Redis in a container next to your course container, without storage, clustering, or any custom settings.

```
docker run -d -p 6379:6379 redis
```
The Docker command above will run Redis in detached mode, exposed on port `6379` of your local computer. From there, you can connect
to the Redis service from your course container using the `-h` flag to specify a host:

```
redis-cli -h 172.17.0.1
```

### Practice

After watching the lecture video, try the following:

1. List all keys:
```
keys *
```
2. Insert 4 keys using the firstnames and lastnames of people as keys and values:
```
set jim ryan
set john jingle-jacob-heimer-schmidt
set tina fey
set leonardo davcinci
```
3. Fetch some of those values using their keys:
```
get jim
get leonardo
get tina
```
4. Set 3 Key-Value pairs using integers as the value. Add expiration times in seconds:
```
set counter1 10 EX 30 
set counter2 472 EX 60 
set counter3 984 EX 44 
```
Next retrieve these values by key, one by one. Repeat this process for the next minute or two. Can you continue to fetch these values?
5. sdf

## MongoDB

MongoDB helped popularize the NoSQL approach and remains a favorite choice among many developers because of its speed and
relative simplicity to work with. Like Redis, MongoDB tables (i.e. "collections") consist of keys and values, but the value
side is made up of variable payloads of JSON. This means that one row (i.e. "record" or "document") may contain JSON with
a handful of values while the next row contains dozens more. There is no requirement for records to conform to a pre-defined
schema or structure.

![MongoDB Documents](https://media.geeksforgeeks.org/wp-content/uploads/20200726190757/subtractdatabase-648x660.jpg)

Mongo allows developers to search across documents for specific data elements in the JSON tree, to add arbitrary documents within
the same collection, but a relatively small amount of data per document (16MB). This allows Mongo to keep frequently-accessed documents
in memory.

MongoDB's strongest features for data science are:

1. Simple to use for storing varied datasets.
2. Popularity in the community.
3. Can be run locally, on a server, or in the cloud.
4. Returns results quickly.

[**Learn more about MongoDB**](https://www.mongodb.com/)

### Run MongoDB & Connect

**Setup**

This course will be using MongoDB Atlas, a cloud-based Mongo service, for hands-on exercises. Follow the instructions in the [**How To video**](https://www.youtube.com/watch?v=5-tIfDCb-T4) for setup. I recommend
using a Google account when creating your [**Atlas MongoDB Cluster**](https://www.mongodb.com/cloud/atlas/register).

[![Create MongoDB Atlas Account](https://nmagee.github.io/ds3002/images/google-signup.png)](https://account.mongodb.com/account/sso/google?signupSource=&referer=null)

**Connect**

The DS3002 course container contains the `mongo` shell application. From MongoDB Atlas, click on the CONNECT button of your cluster
and select "Connect with the Mongo shell." This will give you a connection string:

```
mongo "mongodb+srv://cluster0.pguxs.mongodb.net/myFirstDatabase" --username <username>
```

Customize the command slightly:

- Remove `myFirstDatabase` from the connection string.
- Replace `<username>` with the user you created.

You will be prompted for your password and should then gain a prompt:

```
root@a18a980325ad:/workspaces/course# mongo "mongodb+srv://cluster0.pguxs.mongodb.net" --username mongo
MongoDB shell version v4.4.4
Enter password: 
connecting to: mongodb://cluster0-shard-00-00.pguxs.mongodb.net:27017,cluster0-shard-00-01.pguxs.mongodb.net:27017,cluster0-shard-00-02.pguxs.mongodb.net:27017/?authSource=admin&compressors=disabled&gssapiServiceName=mongodb&replicaSet=atlas-f0pmyi-shard-0&ssl=true
Implicit session: session { "id" : UUID("bb19fed7-39b9-4089-b292-fbbcc5f0efcf") }
MongoDB server version: 4.4.4
MongoDB Enterprise atlas-f0pmyi-shard-0:PRIMARY> 
```

### Practice

After watching the [**Mongo in 30 minutes**](https://www.youtube.com/watch?v=pWbMrx5rVBE) video, try these exercises:

1. From within the Atlas Cloud console, load sample data using the `...` button in your cluster settings.
![Add sample data to MongoDB](https://nmagee.github.io/ds3002/images/mongo-sample-data.png)
2. Using your `mongo` shell, list your databases, select the `sample_weatherdata` set, then show collections within that:
```
show dbs;
use sample_weatherdata;
show collections;
```
3. This should show you there is a `data` collection within that database. Find all records in the collection, then display them using the `.pretty()` flag, and finally count them:
```
db.data.find();
db.data.find().pretty();
db.data.find().count();
```
4. Search for all records containing a `skyCondition.ceilingHeight.value` of `750` and count the results. Then display the results:
```
db.data.find({"skyCondition.ceilingHeight.value":750}).count();
db.data.find({"skyCondition.ceilingHeight.value":750}).pretty();
```
5. Retrieve a single record based on `ObjectId`:
```
db.data.find(ObjectId("5553a998e4b02cf7151195d3")).pretty();
```
6. Finally, using the code below insert a new record. After insertion, can you retrieve this record?
```
db.data.insertOne({
        "st" : "x+85600-124000",
        "ts" : ISODate("1984-03-07T13:00:00Z"),
        "position" : {
                "type" : "Point",
                "coordinates" : [
                        -124,
                        85.6
                ]
        },
        "elevation" : 8787,
        "callLetters" : "ROBZ",
        "qualityControlProcess" : "V020",
        "dataSource" : "3",
        "type" : "FM-13",
        "airTemperature" : {
                "value" : -22.9,
                "quality" : "1"
        },
        "dewPoint" : {
                "value" : -24.9,
                "quality" : "1"
        },
        "pressure" : {
                "value" : 1000.2,
                "quality" : "1"
        },
        "wind" : {
                "direction" : {
                        "angle" : 270,
                        "quality" : "1"
                },
                "type" : "N",
                "speed" : {
                        "rate" : 7,
                        "quality" : "1"
                }
        },
        "visibility" : {
                "distance" : {
                        "value" : 7000,
                        "quality" : "1"
                },
                "variability" : {
                        "value" : "N",
                        "quality" : "9"
                }
        },
        "skyCondition" : {
                "ceilingHeight" : {
                        "value" : 760,
                        "quality" : "1",
                        "determination" : "C"
                }
        }
});
```

## DynamoDB

Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. It's a fully managed, multi-region, multi-active, durable database with built-in security, backup and restore, and in-memory caching for internet-scale applications. DynamoDB can handle more than 10 trillion requests per day and can support peaks of more than 20 million requests per second.

DynamoDB's strongest features for data science are:

1. It "just works."
2. As a managed service there is nothing to provision or maintain.
3. Regardless of user requests it remains fast.
4. Scales to any load.

The maximum value of the `value` half of a row in DynamoDB is 400KB, which is considerably smaller than Redis or MongoDB.

[**Learn more about DynamoDB**](https://aws.amazon.com/dynamodb/)

[![Intro to AWS DynamoDB](http://img.youtube.com/vi/sI-zciHAh-4/0.jpg)](http://www.youtube.com/watch?v=sI-zciHAh-4 "AWS DynamoDB")

### Create a Table & Connect



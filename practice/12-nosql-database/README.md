# NoSQL Databases

We will touch three NoSQL database systems in this section of the course:

1. [Redis](#redis) - an in-memory Key-Value database.
2. [MongoDB](#mongodb) - a popular document database.
3. [DynamoDB](#dynamodb) - Amazon's cloud-based NoSQL service that offers both key-value and document features.

## Redis

Think of Redis as an exceptionally fast, 2-column lookup table. It makes no use of schemas, relations, or indexes.

- The LEFT `key` column (metaphorically speaking) in a Redis DB stores keys. Keys can consist of any useful, unique, identifier.
- The RIGHT `value` column in a Redis DB can consist of a variety of data types, such as strings, integers, lists, sets, hash tables, etc.

![Redis Data Types](https://keestalkstech.com/wp-content/uploads/2019/04/redis-data-structure-types1.jpeg)

Redis is "fast" despite its data storage capabilities being relatively large (the `value` half has a maximum capacity of 512MB),
while the database engine attempts to keep frequently-access data in memory for optimal return to requests.

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

1. sdf
2. sdf
3. sdf
4. sdf
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

### Run MongoDB & Connect

**Setup**

This course will be using MongoDB Atlas for hands-on exercises. Follow the instructions in the How To video for setup. I recommend
using a Google account when creating your [Atlas MongoDB Cluster](https://www.mongodb.com/cloud/atlas/register).

[![Create MongoDB Atlas Account](https://nmagee.github.io/ds3002/images/google-signup.png)](https://account.mongodb.com/account/sso/google?signupSource=&referer=null)

**Connect**

The DS3002 course container contains the `mongo` shell application. From MongoDB Atlas, click on the CONNECT button of your cluster
and select "Connect with the Mongo shell." This will give you a command something like this:

```
mongo "mongodb+srv://cluster0.pguxs.mongodb.net/myFirstDatabase" --username <username>
```

- Remove `myFirstDatabase` from the connection string.
- Replace `<username>` with the user you created.

You will be prompted for your password and should end up with a prompt like this:

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

After watching the "Mongo in 30 minutes" video, try these exercises:

1. sdf
2. sdf
3. sdf
4. sdf
5. sdf

## DynamoDB

placeholder text goes here.

### Create a Table & Connect



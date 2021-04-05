# NoSQL Databases & Python

Interacting with NoSQL database systems programmatically:

1. [**Redis**](#redis)
2. [**MongoDB**](#mongodb)
3. [**DynamoDB**](#dynamodb)

## Redis

### Python Support

Use the `redis` Python package:
```
pip install redis
```

Basic connection and commands:
```
>>> import redis
>>> r = redis.Redis(host='172.17.0.1', port=6379, db=0)
>>> r.set('foo', 'bar')
True
>>> r.get('foo')
b'bar'
```

## MongoDB

### Python Support

Use the `pymongo` library:
```
pip install pymongo
```

**Learn more:**
- Follow the [**PyMongo Documentation**](https://docs.mongodb.com/drivers/pymongo/) from MongoDB for connection information, basic CRUD operations, and options.
- For deeper fundamentals of MongoDB, consider the FREE [**MongoDB Basics**](https://university.mongodb.com/courses/M001/about) from MongoDB University.
- For advanced usage of MongoDB within Python applications, consider the FREE [**MongoDB for Python Developers**](https://university.mongodb.com/courses/M220P/about) course from MongoDB University.

## DynamoDB

### Connect

### Hands-On Exercises

Follow the [**Qwiklab: Amazon DynamoDB CRUD Activities Using the AWS CLI and SDK**](https://www.qwiklabs.com/focuses/15604?catalog_rank=%7B%22rank%22%3A5%2C%22num_filters%22%3A0%2C%22has_search%22%3Atrue%7D&parent=catalog&search_id=8646367) lab for hands-on exercises.

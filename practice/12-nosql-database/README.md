# NoSQL Databases

We will touch three NoSQL database systems in this section of the course:

1. Redis - an in-memory Key-Value database.
2. MongoDB - a popular document database.
3. DynamoDB - Amazon's cloud-based NoSQL service that offers both key-value and document features.

## Redis

Think of Redis as an exceptionally fast, 2-column lookup table. It makes no use of schemas, relations, or indexes.

- The LEFT `key` column (metaphorically speaking) in a Redis DB stores keys. Keys can consist of any useful, unique, identifier.
- The RIGHT `value` column in a Redis DB can consist of a variety of data types, such as strings, integers, lists, sets, hash tables, etc.

![Redis Data Types](https://keestalkstech.com/wp-content/uploads/2019/04/redis-data-structure-types1.jpeg)

Redis is "fast" because its data storage capabilities are not excessive (the `value` half has a maximum capacity of 512MB)
and the database engine attempts to keep data in memory for optimal return to requests.

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

Mongo allows developers to search across documents for specific data elements in the JSON tree.

![MongoDB Documents](https://media.geeksforgeeks.org/wp-content/uploads/20200726190757/subtractdatabase-648x660.jpg)

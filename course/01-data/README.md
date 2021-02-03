# Working with file formats

## json

Some iterations to try using the `jq` tool in the command-line:

```
cd /root/course/01-data/

cat mock_data.json

cat mock_data.json | jq -r .[]

cat mock_data.json | jq -r .[] | jq -r ."dob"

cat mock_data.json | jq -r .[] | jq -r ."dob" | grep "1998"

cat mock_data.json | jq -r .[] | jq -r ."dob" | grep "1998" | wc -l
```

Try https://jqplay.org for more lessons, inputs, filters, etc.

- - - - -

## csv

- - - - -

## xml

- - - - -

## tsv

- - - - -

## sql

`cat` and `head` and `tail` the SQL snippet. Notice that each line consists of an isolated query.
So that file is not a bulk insert statement (not properly) but a concatenated series of independent
SQL statements. This is a best practice so that any single line that triggers a failure can be more
easily identified and the previous inserts will have succeeded.

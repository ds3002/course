#!/bin/bash

# In order to get/fetch a remote HTTP resource, use the `curl`, `wget` or `httpie` tools:
# Sample URL:
# https://api.github.com/repos/nmagee/ds3002/branches

# Using curl:
curl -X GET https://api.github.com/repos/nmagee/ds3002/branches

# Using wget:
wget https://api.github.com/repos/nmagee/ds3002/branches

# Using httpie:
http --body https://api.github.com/repos/nmagee/ds3002/branches


# ---------------------------------------------------------------------------------------
# Now you're receiving JSON! Use jq to parse/filter it:

# Filter for just the names of the branches:
http --body https://api.github.com/repos/nmagee/ds3002/branches | jq -r .[].name

# Filter for just the sha hashes of the latest commits:
http --body https://api.github.com/repos/nmagee/ds3002/branches | jq -r .[].commit.sha

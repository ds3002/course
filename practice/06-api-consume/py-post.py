#!/usr/bin/env python3

import json
import requests
import os

## Setup
##
## https://github.com/settings/tokens and generate a new token.
## GITHUB_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
##

token = os.getenv('GITHUB_TOKEN')

url = "https://api.github.com/gists"

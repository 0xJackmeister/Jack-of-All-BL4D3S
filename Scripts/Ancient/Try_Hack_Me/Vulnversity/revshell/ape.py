#!/usr/bin/env python

import requests
import os

url = "http://10.10.214.13:3333/internal/index.php"

filename = "revshell"

extensions = {
	".php"
	".php3"
	".php4"
	".php5"
	".phtml"
}

for file in extensions:
	filename = os.path.join(filename,ext)
	print(filename)
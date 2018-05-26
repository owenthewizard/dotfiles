#!/usr/bin/env python3

# Example: wallpaper.py wallpaper 1920x1080

import json
import requests
import tempfile

import subprocess
import sys

subreddit = sys.argv[1]
resolution = sys.argv[2]

reddit = requests.get("http://www.reddit.com/r/{}.json".format(subreddit), headers={"user-agent":"linux:wallpaper:BETA (by /u/owenthewizard)"})

for post in reddit.json()["data"]["children"]:
    if "[{}]".format(resolution) in post["data"]["title"]:
        url = post["data"]["url"]
        break

image = requests.get(url)
with tempfile.NamedTemporaryFile(mode="wb") as temp:
    temp.write(image.content)
    subprocess.run(["feh", "--no-fehbg", "--image-bg", "black", "--bg-center", temp.name])

#!/usr/bin/env python3

# Example: wallpaper.py wallpaper 1920x1080

# Should we keep the most recent wallpaper?
KEEP_WALLPAPER=True

import json
import requests
import tempfile

import os
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
# Could probably obey DRY here... meh
if KEEP_WALLPAPER:
    os.chdir(os.environ["HOME"])
    with open(".wallpaper", mode="wb") as out:
        out.write(image.content)
        subprocess.run(["feh", "--no-fehbg", "--image-bg", "black", "--bg-center", out.name])
else:
    with tempfile.NamedTemporaryFile(mode="wb") as temp:
        temp.write(image.content)
        subprocess.run(["feh", "--no-fehbg", "--image-bg", "black", "--bg-center", temp.name])

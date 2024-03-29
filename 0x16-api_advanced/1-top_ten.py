#!/usr/bin/python3
"""
function that queries the Reddit API
& prints the titles of the first 10 posts.
"""
import requests


def top_ten(subreddit):
    """
    returns top-ten posts
    """
    url = 'https://www.reddit.com'
    header = {
        'accept': 'application/json',
        'user-Agent': 'Mozilla/5.0 (Linux-Ubuntu 20.4; x64)'
    }
    response = requests.get('{}/r/{}/.json?sort={}&limit={}'.format(
        url, subreddit, 'top', 10),
        headers=header,
        allow_redirects=False)
    # if not valid subreddit, print None.
    if response.status_code == 200:
        for post in response.json()['data']['children'][0:10]:
            print(post['data']['title'])
    else:
        print(None)

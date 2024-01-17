#!/usr/bin/python3
"""
function that queries the Reddit API
& returns the number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """
    returns total number of subscribers
    """
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {
            'accept': 'application/json',
            'user-agent': 'Mozilla/5.0 (Linux-Ubuntu 20.4; x64)'}
    response = requests.get(url, headers=headers)

    # if not a valid subreddit, return 0
    if response.status_code == 200:
        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers
    return 0

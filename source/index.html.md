---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the FortuneTeller API.

# Authentication

FortuneTeller API uses OAuth client_credentials flow for authorization.

```shell
# With shell, you can just pass the correct header with each request
curl --request POST \
  --url 'https://auth.fortune-teller.io/connect/token' \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data grant_type=client_credentials \
  --data client_id=client_id \
  --data client_secret=client_secret \
  --data scope=api
```

```javascript
var request = require("request");

var client_id = "client_id";
var client_secret = "client_secret";
var address = "https://app.fortune-teller.io/dota/v2"

var options = {
    method: 'POST',
    url: 'https://auth.fortune-teller.io/connect/token',
    headers: { 'content-type': 'application/x-www-form-urlencoded' },
    body: `grant_type=client_credentials&client_id=${client_id}&client_secret=${client_secret}&scope=reactive`
};

request(options, function (error, response, body) {
    if (error)
        throw new Error(error);

    var parsed = JSON.parse(body);
    var access_token = parsed.access_token;
}
```

### Scopes

1. api - gives access to REST API.
2. reactive - gives access to socket.io endpoint.
3. monitor - gives access to monitor application.


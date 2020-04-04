## Team Logo API

Team Logo API is not protected by authorization and can be (but not recommended) embedded into html for example.
There is no CDN system beneath this API at the moment, so it can became a source of significant latency. 
The caching by consumer is strongly recommended. 
The unprotected nature of this API can be subject to change and should not be relied on.

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/dota/logo/team/{logoId}' --output ${logoId}.png
```

```javascript
var logoId = 'logoId';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/dota/logo/team/${logoId}`,
};

var file = fs.createWriteStream(`{logoId}.png`);

request(options)
  .pipe(file)
  .on('finish', () => {
        console.log(`The file is finished downloading.`);
        resolve();
  })
  .on('error', (error) => {
        console.log(error);
  })

```

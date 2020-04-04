## Assets API

Assets API is dota static resources API and can be (but not recommended) embedded into html for example.
There is no CDN system beneath this API at the moment, so it can became a source of significant latency. 
The caching by consumer is strongly recommended. 
The unprotected nature of this API can be subject to change and should not be relied on.

### minimap/map

Retrieve Dota 2 minimap image. Map dimensions are 8192x8192 which should be used in map object rendering

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/dota/minimap/map' --output map.jpg
```

```javascript
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/dota/minimap/map`,
};

var file = fs.createWriteStream(`map.jpg`);

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


### minimap/{side}/{structure}

Retrieve Dota 2 structures images for minimap.

#### Supported sides:
1. radiant
2. dire

#### Supported structures:
1. ancient
2. barrack
3. barrackangle
3. tower
3. towerangle

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/dota/minimap/{side}/{structure}' --output ${side}_${structure}.png
```

```javascript
var side = 'side';
var structure = 'structure';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/dota/minimap/${side}/${structure}`,
};

var file = fs.createWriteStream(`${side}_${structure}.png`);

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

### hero/{id}/mini

Heroes mini icons for rendering on map

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/dota/hero/{id}/mini' --output ${id}.png
```

```javascript
var id = 'id';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/dota/hero/${id}/mini`,
};

var file = fs.createWriteStream(`{id}.png`);

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

### hero/{id}/portrait

Heroes portraits

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/dota/hero/{id}/portrait' --output ${id}.png
```

```javascript
var id = 'id';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/dota/hero/${id}/portrait`,
};

var file = fs.createWriteStream(`{id}.png`);

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

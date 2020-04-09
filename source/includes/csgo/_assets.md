## [CSGO] Assets API

Assets API is dota static resources API and can be (but not recommended) embedded into html for example.
There is no CDN system beneath this API at the moment, so it can became a source of significant latency. 
The caching by consumer is strongly recommended. 
The unprotected nature of this API can be subject to change and should not be relied on.

### ​{side}​/icon

Retrieve CSGO sides icons. Supported sides: `CounterTerrorists`, `Terrorists`

```shell
curl --request GET --url 'https://app.fortune-teller.io/api​/csgo​/{side}​/icon' --output ${side}_icon.png
```

```javascript
var side = 'CounterTerrorists';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api​/csgo​/{side}​/icon`,
};

var file = fs.createWriteStream(${side}_icon.png);

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


### item/{name}

Retrieve CSGO items images

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/csgo/item/{name}' --output ${name}.png
```

```javascript
var item = 'name';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/csgo/item/{item}`,
};

var file = fs.createWriteStream(`${item}.png`);

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

### map/{name}

Heroes mini icons for rendering on map

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/csgo/map/{name}' --output ${name}.png
```

```javascript
var name = 'name';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/csgo/map/{name}`,
};

var file = fs.createWriteStream(`{name}.png`);

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

### win/{side}/{type}

Win type icons.

Supported sides: 
1. `CounterTerrorists`
2. `Terrorists`

Supported win types for `CounterTerrorists`:
1. `Timeout`
2. `Annihilation`
3. `Defused`

Supported win types for `Terrorists`:
1. `Annihilation`
2. `Bombed`


```shell
curl --request GET --url 'https://app.fortune-teller.io/api/csgo/win/{side}/{type}' --output ${side}_${type}.svg
```

```javascript
var side = 'CounterTerrorists';
var type = 'Timeout';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/csgo/win/{side}/{type}`,
};

var file = fs.createWriteStream(`${side}_${type}.svg`);

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

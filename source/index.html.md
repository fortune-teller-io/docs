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

Welcome to the FortuneTeller. Currently, Fortune Teller consists of three main products:

1. REST API
2. Socket.io real-time API
3. Monitor frontend application

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

---

### Scopes

| **Scope**  | **Description**
| ---        | --- 
| `api`      | Gives access to REST API
| `reactive` | Gives access to socket.io endpoint
| `monitor`  | Gives access to monitor application

# Dota

## Live games API

```shell
curl --request GET \
  --url 'https://app.fortune-teller.io/api/dota/live' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/dota/live',
    headers: {
      'Accept': 'application/json',
      'Authorization': `Bearer ${access_token}`,
    }
};

request(options, function (error, response, body) {
    if (error)
        throw new Error(error);

    var parsed = JSON.parse(body);
    var items = parsed.items;
}
```

> The above command returns JSON structured like this:

```json
{
  "count": 1,
  "items": [
    {
      "match_id": 9792,
      "game_time": 2546,
      "series": {
        "series_id": 9059,
        "game_number": 1,
        "dire_wins": 0,
        "radiant_wins": 0
      },
      "radiant": {
        "team_id": 565,
        "name": "KZ.D2"
      },
      "dire": {
        "team_id": 578,
        "name": "SK.D2"
      },
      "markets": [
        {
          "id": "radiant_team_win",
          "game_time": 2546,
          "result": null,
          "status": "Open",
          "message": "No reason to put on hold found",
          "predictions": [
            {
              "outcome": 0,
              "label": "Dire win",
              "probability": 0.5541133036827675,
              "odds": 1.7,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 1,
              "label": "Radiant win",
              "probability": 0.44588669631723254,
              "odds": 2.08,
              "is_locked": false,
              "lock_reason": null
            }
          ]
        },
        {
          "id": "radiant_team_race_to_10_kills",
          "game_time": 735,
          "result": {
            "outcome": 1,
            "label": "Radiant first"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_20_kills",
          "game_time": 1066,
          "result": {
            "outcome": 1,
            "label": "Radiant first"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_30_kills",
          "game_time": 1539,
          "result": null,
          "status": "WaitingForResult",
          "message": "Market outcome is unclear. Waiting for replay to determine result",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_40_kills",
          "game_time": 1920,
          "result": {
            "outcome": 0,
            "label": "Dire first"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_50_kills",
          "game_time": 2546,
          "result": null,
          "status": "OnHold",
          "message": "Dire first probability is higher than 0.80",
          "predictions": [
            {
              "outcome": 0,
              "label": "Dire first",
              "probability": 0.9270702496626473,
              "odds": 1.03,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 1,
              "label": "Radiant first",
              "probability": 0.07292975033735272,
              "odds": 8.86,
              "is_locked": false,
              "lock_reason": null
            }
          ]
        }
      ]
    }
  ]
}
```

Live games API will return all live games with relevant predictions.

---

### Match structure

1. `match_id`: the identifier, see [section](#markets) below
2. `game_time`: current in-game time in seconds
3. `series`: describes series of matches
    1. `series_id`: the id of the first match in the series defines the series_id
    2. `game_number`: ordinal number inside the series
    3. `dire_wins`: number of games dire have won when current match started
    4. `radiant_wins`: number of games radiant have won when current match started
4. `radiant` and `dire`: describes particiapting teams
5. `markets`: desribes available markets
    1. `id`: identifier of the market
    2. `game_time`: the in-game time of prediction or result, this can be different from match game_time when market is resolved as it won't advance
    3. `result`: describes the outcome of the market, can be null
        1. `outcome`: describes the numeric outcome
        2. `label`: human-readable description of outcome
    4. `status`: market status, see [section](#market-status) below
    5. `message`: human-readable explanation of why market is in specified state
    6. `predictions`: market predictions
        1. `outcome`: predicted outcome
        2. `label`: predicted outcome label
        3. `probability`: probability of outcome
        4. `odds`: reccomended odds
        5. `is_locked`: specifies whether this outcome is recomended to be locked
        6. `lock_reason`: the reason of lock reccomendation, can be null

---

### Markets

Market id can have following values:

| **Value**                            | **Description** |
| ---                                  | ---             |
| `radiant_team_win`                   |  The radiant team will win current map
| `radiant_team_higher_gpm`            |  The radiant team have higher combined GPM when the map ends
| `radiant_team_higher_xpm`            |  The radiant team have higher combined XPM when the map ends
| `radiant_team_higher_kills`          |  The radiant team have higher combined kills count when the map ends
| `radiant_team_first_blood`           |  The radiant team will take first blood
| `radiant_team_first_roshan`          |  The radiant team will take first roshan
| `radiant_team_destroy_first_tower`   |  The radiant team will destroy first tower on the map
| `radiant_team_destroy_first_barrack` |  The radiant team will destroy first barrack on the map
| `radiant_player_higher_gpm`          |  The radiant player will have higher GPM when the map ends
| `radiant_player_higher_xpm`          |  The radiant player will have higher XPM when the map ends
| `radiant_player_higher_kills`        |  The radiant player will have higher kills count when the map ends
| `radiant_team_race_to_10_kills`      |  The radiant player team will first get to 10 total kills
| `radiant_team_race_to_20_kills`      |  The radiant player team will first get to 20 total kills
| `radiant_team_race_to_30_kills`      |  The radiant player team will first get to 30 total kills
| `radiant_team_race_to_40_kills`      |  The radiant player team will first get to 40 total kills
| `radiant_team_race_to_50_kills`      |  The radiant player team will first get to 50 total kills
| `radiant_team_race_to_60_kills`      |  The radiant player team will first get to 60 total kills
| `radiant_team_race_to_70_kills`      |  The radiant player team will first get to 70 total kills
| `radiant_team_race_to_80_kills`      |  The radiant player team will first get to 80 total kills
| `radiant_team_race_to_90_kills`      |  The radiant player team will first get to 90 total kills
| `radiant_team_race_to_100_kills`     |  The radiant player team will first get to 100 total kills

<aside class="warning">
Dota in-game UI shows number of deaths as a score, so seeing 10 on the scoreboard does not necessary imply that <code>radiant_team_race_to_10_kills</code> should be already resolved.
</aside>

---

### Market status

Market status can have following values:

| **Value**           | **Description** |
| ---                 | ---             |
| `Open`              | The market is open and is recommended to be traded
| `OnHold`            | The market is put on hold due to market template configuration and is recommended not to be traded
| `WaitingForResult`  | Some data sources can not provide enough information to resolve market in real-time (due to absence of data or not enough resolution). The result will be available after replay parse
| `Resolved`          | Market is resolved successfully

## Real-time API

For JavaScript real-time socket.io connection is another available option to consume live matches.

```javascript
var io = require('socket.io-client');

var socket = io("https://app.fortune-teller.io/dota/v2", {
        extraHeaders: {
            Authorization: `Bearer ${access_token}`
        }
    })

    socket.on('connect', () => {
        console.log('Connected');
    })
    socket.on('match', (data) => {
        console.log(JSON.stringify(data));
    });
    socket.on('reconnect', attempt => {
        console.log(`Reconnect #${attempt}`);
    })
    socket.on('disconnect', () => {
        console.log('Disconnected');
    });
    socket.on('error', (error) => {
        console.log(error);
    });
```

> Match event will have following form

```json
{
  "match_id": 9792,
  "game_time": 2546,
  "series": {
    "series_id": 9059,
    "game_number": 1,
    "dire_wins": 0,
    "radiant_wins": 0
  },
  "radiant": {
    "team_id": 565,
    "name": "KZ.D2"
  },
  "dire": {
    "team_id": 578,
    "name": "SK.D2"
  },
  "markets": [
    {
      "id": "radiant_team_win",
      "game_time": 2546,
      "result": null,
      "status": "Open",
      "message": "No reason to put on hold found",
      "predictions": [
        {
          "outcome": 0,
          "label": "Dire win",
          "probability": 0.5541133036827675,
          "odds": 1.7,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Radiant win",
          "probability": 0.44588669631723254,
          "odds": 2.08,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_team_race_to_10_kills",
      "game_time": 735,
      "result": {
        "outcome": 1,
        "label": "Radiant first"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_20_kills",
      "game_time": 1066,
      "result": {
        "outcome": 1,
        "label": "Radiant first"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_30_kills",
      "game_time": 1539,
      "result": null,
      "status": "WaitingForResult",
      "message": "Market outcome is unclear. Waiting for replay to determine result",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_40_kills",
      "game_time": 1920,
      "result": {
        "outcome": 0,
        "label": "Dire first"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_50_kills",
      "game_time": 2546,
      "result": null,
      "status": "OnHold",
      "message": "Dire first probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "Dire first",
          "probability": 0.9270702496626473,
          "odds": 1.03,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Radiant first",
          "probability": 0.07292975033735272,
          "odds": 8.86,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    }
  ]
}
```

<aside class="warning">
It is strongly recommended to obtain new access token on each reconnection.
</aside>

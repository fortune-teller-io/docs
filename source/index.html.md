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
      "league": {
        "league_id": 817,
        "name": "Botwars, Dota2 Season 17"
      },
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

1. `match_id`: the identifier
2. `game_time`: current in-game time in seconds
3. `state`: describes match state, see [section](#match-state) below
4. `league`: describes league the match belongs to
    1. `league_id`: the identifier
    2. `name`: name of the league
5. `series`: describes series of matches
    1. `series_id`: the id of the first match in the series defines the series_id
    2. `game_number`: ordinal number inside the series
    3. `dire_wins`: number of games dire have won when current match started
    4. `radiant_wins`: number of games radiant have won when current match started
6. `radiant` and `dire`: describes particiapting teams
7. `markets`: desribes available markets
    1. `id`: identifier of the market, see [section](#markets) below
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

### Match state

Match state can have following valued:

| **Value**           | **Description** |
| ---                 | ---             |
| `Ready`             | The match is ready and being traded
| `Ended`             | The match end result have been observed. This will resolve such markets as `radiant_team_win`, `radiant_team_higher_gpm`, `radiant_team_higher_xpm`, `radiant_team_higher_kills`, `radiant_player_higher_gpm`, `radiant_player_higher_xpm`, `radiant_player_higher_kills`
| `WaitingForReplayParse` | To address ambuguity and overcome fundamental data source we process replays. This will resolve all markets that have not been resolved during match being live. Also, markets such as `radiant_team_first_roshan` are currently only resolved from replay. The match will transition to this state when replay url will be determined and will stay in it until file is processed.
| `ReplayNotAvailable` | There are rare cases when match replay was not recorded and is not available. Is such cases unresolved markets will be marked as `NotHappened`. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ReplayParsed`       | Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.

### Markets

Market id can have following values:

| **Value**                           |**Outcomes**                                                  | **Description** |
| ---                                 |  ---                                                         | ---             |
| `radiant_team_win`                  |0 - dire won<br>1 - radiant won                                 | The radiant team will win current map
| `radiant_team_higher_gpm`           |0 - dire higher gpm<br>1 - radiant higher gpm                   | The radiant team have higher combined GPM when the map ends
| `radiant_team_higher_xpm`           |0 - dire higher xpm<br>1 - radiant higher xpm                   | The radiant team have higher combined XPM when the map ends
| `radiant_team_higher_kills`         |0 - dire higher kills count<br>1 - radiant higher kills count | The radiant team have higher combined kills count when the map ends
| `radiant_team_first_blood`          |0 - dire first blood<br>1 - radiant first blood                 | The radiant team will take first blood
| `radiant_team_first_roshan`         |0 - dire first roshan<br>1 - radiant first roshan               | The radiant team will take first roshan
| `radiant_team_destroy_first_tower`  |0 - dire destroy first tower<br>1 - radiant destroy first tower | The radiant team will destroy first tower on the map
| `radiant_team_destroy_first_barrack`|0 - dire destroy first barrack<br>1 - radiant destroy first barrack| The radiant team will destroy first barrack on the map
| `radiant_player_higher_gpm`         |0 - dire player higher gpm<br>1 - radiant player higher gpm      | The radiant player will have higher GPM when the map ends
| `radiant_player_higher_xpm`         |0 - dire player higher xpm<br>1 - radiant player higher xpm      | The radiant player will have higher XPM when the map ends
| `radiant_player_higher_kills`       |0 - dire player higher kills<br>1 - radiant player higher kills | The radiant player will have higher kills count when the map ends
| `radiant_team_race_to_10_kills`     |0 - dire first 10 team kills<br>1 - radiant first 10 team kills  | The radiant player team will first get to 10 total kills
| `radiant_team_race_to_20_kills`     |0 - dire first 20 team kills<br>1 - radiant first 20 team kills  | The radiant player team will first get to 20 total kills
| `radiant_team_race_to_30_kills`     |0 - dire first 30 team kills<br>1 - radiant first 30 team kills  | The radiant player team will first get to 30 total kills
| `radiant_team_race_to_40_kills`     |0 - dire first 40 team kills<br>1 - radiant first 40 team kills  | The radiant player team will first get to 40 total kills
| `radiant_team_race_to_50_kills`     |0 - dire first 50 team kills<br>1 - radiant first 50 team kills  | The radiant player team will first get to 50 total kills
| `radiant_team_race_to_60_kills`     |0 - dire first 60 team kills<br>1 - radiant first 60 team kills  | The radiant player team will first get to 60 total kills
| `radiant_team_race_to_70_kills`     |0 - dire first 70 team kills<br>1 - radiant first 70 team kills  | The radiant player team will first get to 70 total kills
| `radiant_team_race_to_80_kills`     |0 - dire first 80 team kills<br>1 - radiant first 80 team kills  | The radiant player team will first get to 80 total kills
| `radiant_team_race_to_90_kills`     |0 - dire first 90 team kills<br>1 - radiant first 90 team kills  | The radiant player team will first get to 90 total kills
| `radiant_team_race_to_100_kills`    |0 - dire first 100 team kills<br>1 - radiant first 100 team kills| The radiant player team will first get to 100 total kills

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
| `NotHappened`       | None of the market outcomes occurred and market is recommended to be refund

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
  "state": "Ready",
  "league": {
    "league_id": 817,
    "name": "Botwars, Dota2 Season 17"
  },
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

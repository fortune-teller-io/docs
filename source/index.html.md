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
  "count": 2,
  "items": [
    {
      "match_id": 9792,
      "game_time": 2546,
      "state": "Ready",
      "started_at": "2019-07-23T12:49:37.8756110Z",
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
    },
    {
      "match_id": 4990466893,
      "game_time": 938,
      "state": "ParseCompleted",
      "started_at": "2019-08-27T11:38:05.2506405Z",
      "league": {
        "league_id": 10605,
        "name": "Epulze.com"
      },
      "series": {
        "series_id": 4990384044,
        "game_number": 2,
        "dire_wins": 0,
        "radiant_wins": 1
      },
      "radiant": {
        "team_id": 7313524,
        "name": "Ogorod Gaming",
        "logo": "795368055541056205"
      },
      "dire": {
        "team_id": 0,
        "name": "Dire",
        "logo": null
      },
      "markets": [
        {
          "id": "radiant_team_win",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant win"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_higher_gpm",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_higher_xpm",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_higher_kills",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_player_higher_gpm",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_player_higher_xpm",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_player_higher_kills",
          "label": null,
          "game_time": 938,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_10_kills",
          "label": null,
          "game_time": 604,
          "result": {
            "outcome": 1,
            "label": "Radiant first"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_destroy_first_barrack",
          "label": null,
          "game_time": 900,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_destroy_first_tower",
          "label": null,
          "game_time": 372,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_first_blood",
          "label": null,
          "game_time": 166,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_first_roshan",
          "label": null,
          "game_time": 566,
          "result": {
            "outcome": 1,
            "label": "Radiant"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_20_kills",
          "label": null,
          "game_time": 938,
          "result": null,
          "status": "NotHappened",
          "message": "Result did not happen",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_30_kills",
          "label": null,
          "game_time": 938,
          "result": null,
          "status": "NotHappened",
          "message": "Result did not happen",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_40_kills",
          "label": null,
          "game_time": 938,
          "result": null,
          "status": "NotHappened",
          "message": "Result did not happen",
          "predictions": null
        },
        {
          "id": "radiant_team_race_to_50_kills",
          "label": null,
          "game_time": 938,
          "result": null,
          "status": "NotHappened",
          "message": "Result did not happen",
          "predictions": null
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
4. `started_at`: first time when the match was observed, usually when pick/ban stage started
5. `league`: describes league the match belongs to
    1. `league_id`: the identifier
    2. `name`: name of the league
    3. `logo`: the logo identifier, see [section](#logo-api) below
6. `series`: describes series of matches
    1. `series_id`: the id of the first match in the series defines the series_id
    2. `game_number`: ordinal number inside the series
    3. `dire_wins`: number of games dire have won when current match started
    4. `radiant_wins`: number of games radiant have won when current match started
7. `radiant` and `dire`: describes participating teams
    1. `team_id`: the identifier
    2. `name`: name
    3. `logo`: the logo identifier
8. `streams`: describes live streams taht were resolved for particular match
    1. `url`: the url of the steam
    2. `title`: either setup or generated title of the stream
    3. `type`: used to describe the source of the stream, see [section](#stream-types) below
9. `markets`: desribes available markets
    1. `id`: identifier of the market, see [section](#markets) below
    2. `label`: human readable market label
    3. `game_time`: the in-game time of prediction or result, this can be different from match game_time when market is resolved as it won't advance
    4. `result`: describes the outcome of the market, can be null
        1. `outcome`: describes the numeric outcome
        2. `label`: human-readable description of outcome
    5. `status`: market status, see [section](#market-status) below
    6. `message`: human-readable explanation of why market is in specified state
    7. `predictions`: market predictions
        1. `outcome`: predicted outcome
        2. `label`: predicted outcome label
        3. `probability`: probability of outcome
        4. `odds`: reccomended odds
        5. `is_locked`: specifies whether this outcome is recomended to be locked
        6. `lock_reason`: the reason of lock reccomendation, can be null

<aside class="warning">
Any textual information from open sources is not censured or validated and provided as is. Team names, league names or stream titles can contain profanity and should be validate by the end user.
</aside>

---

### Match state

Match state can have following valued:

| **Value**           | **Description** |
| ---                 | ---             |
| `Ready`             | The match is ready and being traded
| `Ended`             | The match end result have been observed. This will resolve such markets as `radiant_team_win`, `radiant_team_higher_gpm`, `radiant_team_higher_xpm`, `radiant_team_higher_kills`, `radiant_player_higher_gpm`, `radiant_player_higher_xpm`, `radiant_player_higher_kills`
| `WaitingForReplayParse` | To address ambuguity and overcome fundamental data source we process replays. This will resolve all markets that have not been resolved during match being live. Also, markets such as `radiant_team_first_roshan` are currently only resolved from replay. The match will transition to this state when replay url will be determined and will stay in it until file is processed.
| `ReplayNotAvailable` | There are rare cases when match replay was not recorded and is not available. Is such cases unresolved markets will be marked as `NotHappened`. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ResultNotAvailable` | Tha match should be considered invalid. This is an observable side effect from underlying data source. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ReplayParsed`       | Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.

### Stream types

Stream type can have following values:

| **Value**   | **Description** |
| ---         | ---             |
| `twitch`    | To match the twitch stream to match the stream title is tested to contain at least one team name stripped from any non alphanumerical symbols or if none were matched contains the name of league
| `trackdota` | Trackdota link will be applied to each match. The liveness of the page on trackdota won't be validated. There are also rare cases when trackdota doesn't track some of the matches from amateur leagues.

<aside class="warning">
The correctness of the live streams is not guaranteed. There can be both cases of missing streams and streams that were resolved incorrectly. The matching logic is subject to change, but as with any algorithm it can not be guaranteed to cover all possible cases.
</aside>

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
| `odd_even_total_kills`              |0 - total kills is even<br>1 - total kills is odd                | Total kills is the sum of both teams kills
| `radiant_odd_even_total_kills`      |0 - total radiant kills is even<br>1 - total radiant kills is odd| Total kills is the sum of radiant team kills
| `dire_odd_even_total_kills`         |0 - total dire kills is even<br>1 - total dire kills is odd      | Total kills is the sum of dire team kills
| `any_team_destroy_first_ranged_barrack`|0 - first destroyed barrack will be melee<br>1 - first destroyed barrack will be ranged | Determines first destroyed barrack type by any of the team

<aside class="warning">
Dota in-game UI shows number of deaths as a score, so seeing 10 on the scoreboard does not necessary imply that <code>radiant_team_race_to_10_kills</code> should be already resolved. The same is applicable for <code>odd_even_total_kills</code> or any other kills related markets.
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

## Logo API

Logo API is not protected by authorization and can be (but not recommended) embedded into html for example.
There is no CDN system beneath this API at the moment, so it can became a source of significant latency. 
The caching by consumer is strongly recommended. 
The unprotected nature of this API can be subject to change and should not be relied on.

```shell
curl --request GET --url 'https://app.fortune-teller.io/api/logo/{logoId}' --output ${logoId}.png
```

```javascript
var logoId = 'logoId';
var options = {
    method: 'GET',
    url: `https://app.fortune-teller.io/api/logo/${logoId}`,
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

> To get team logo substitute {logoId} with value from logo property of team

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
  "match_id": 5109024876,
  "game_time": 1675,
  "state": "Ready",
  "started_at": "2019-11-11T15:23:51.5332709Z",
  "league": {
    "league_id": 5683,
    "name": "Workshop Bot Scripts"
  },
  "series": {
    "series_id": 5109024876,
    "game_number": 1,
    "dire_wins": 0,
    "radiant_wins": 0
  },
  "radiant": {
    "team_id": 4997583,
    "name": "Ranked Matchmaking AI",
    "logo": null
  },
  "dire": {
    "team_id": 4997618,
    "name": "PubSimulator",
    "logo": null
  },
  "streams": [
    {
      "url": "https://www.twitch.tv/fortune_teller",
      "title": "[fortune-teller.io] Workshop Bot Scripts clash",
      "type": "twitch"
    },
    {
      "url": "https://www.trackdota.com/matches/5109024876",
      "title": "[Workshop Bot Scripts] PubSimulator vs Ranked Matchmaking AI",
      "type": "trackdota"
    }
  ],
  "markets": [
    {
      "id": "radiant_team_win",
      "label": "Winner (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "OnHold",
      "message": "Ranked Matchmaking AI probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.13888672503679306,
          "odds": 5.75,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.8611132749632069,
          "odds": 1.12,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_team_higher_gpm",
      "label": "Team with higher GPM (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "OnHold",
      "message": "Ranked Matchmaking AI probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.07056021025983177,
          "odds": 9.47,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.9294397897401683,
          "odds": 1.04,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_team_higher_xpm",
      "label": "Team with higher XPM (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "OnHold",
      "message": "Ranked Matchmaking AI probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.05586911618928207,
          "odds": 11,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.944130883810718,
          "odds": 1.02,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_player_higher_kills",
      "label": "Team has MVP by kills score (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "OnHold",
      "message": "Ranked Matchmaking AI probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.04622031756293052,
          "odds": 12.31,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.9537796824370695,
          "odds": 1.01,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_team_race_to_10_kills",
      "label": "Race to 10 kills (Map 1)",
      "game_time": 1056,
      "result": {
        "outcome": 1,
        "label": "Ranked Matchmaking AI"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_20_kills",
      "label": "Race to 20 kills (Map 1)",
      "game_time": 1411,
      "result": {
        "outcome": 1,
        "label": "Ranked Matchmaking AI"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_30_kills",
      "label": "Race to 30 kills (Map 1)",
      "game_time": 1654,
      "result": {
        "outcome": 1,
        "label": "Ranked Matchmaking AI"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_40_kills",
      "label": "Race to 40 kills (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "OnHold",
      "message": "Ranked Matchmaking AI probability is higher than 0.80",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.0054637671493480205,
          "odds": 18.03,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.994536232850652,
          "odds": 1.01,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "radiant_team_race_to_50_kills",
      "label": "Race to 50 kills (Map 1)",
      "game_time": 1675,
      "result": null,
      "status": "Open",
      "message": "No reason to put on hold found",
      "predictions": [
        {
          "outcome": 0,
          "label": "PubSimulator",
          "probability": 0.23261236975293798,
          "odds": 3.54,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Ranked Matchmaking AI",
          "probability": 0.767387630247062,
          "odds": 1.22,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "odd_even_total_kills",
      "label": "Total kills will be odd or even (Map 1)",
      "game_time": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 1,
          "label": "Odd total kills",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 0,
          "label": "Even total kills",
          "probability": 0.5,
          "odds": 1.87,
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

## Find match API

It is possible to access match by its identifier. The API works both for live and ended matches.

<aside class="notice">
The API will return only results for the markets that were configured in the market templates on the time the match was traded.
</aside>

<aside class="notice">
The matches are persited for one year after end date.
</aside>

```shell
curl --request GET \
  --url 'https://app.fortune-teller.io/api/dota/match/4986461644' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/dota/match/4986461644',
    headers: {
      'Accept': 'application/json',
      'Authorization': `Bearer ${access_token}`,
    }
};

request(options, function (error, response, body) {
    if (error)
        throw new Error(error);

    var match = JSON.parse(body);
}
```

> The above command returns JSON structured like this:

```json
{
  "match_id": 4986461644,
  "game_time": 1474,
  "state": "ParseCompleted",
  "started_at": "2019-08-25T11:50:32.366624Z",
  "league": {
    "league_id": 10749,
    "name": "The International 2019"
  },
  "series": {
    "series_id": 4986133311,
    "game_number": 4,
    "dire_wins": 1,
    "radiant_wins": 2
  },
  "radiant": {
    "team_id": 2586976,
    "name": "OG",
    "logo": "862855679982708969"
  },
  "dire": {
    "team_id": 2163,
    "name": "Team Liquid",
    "logo": "785230100972622130"
  },
  "markets": [
    {
      "id": "radiant_team_win",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant win"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_higher_gpm",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_higher_xpm",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_higher_kills",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_player_higher_gpm",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_player_higher_xpm",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_player_higher_kills",
      "label": null,
      "game_time": 1474,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_10_kills",
      "label": null,
      "game_time": 1118,
      "result": {
        "outcome": 0,
        "label": "Dire first"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_destroy_first_barrack",
      "label": null,
      "game_time": 1395,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_destroy_first_tower",
      "label": null,
      "game_time": 707,
      "result": {
        "outcome": 0,
        "label": "Dire"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_first_blood",
      "label": null,
      "game_time": 130,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_first_roshan",
      "label": null,
      "game_time": 1395,
      "result": {
        "outcome": 1,
        "label": "Radiant"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_20_kills",
      "label": null,
      "game_time": 1462,
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
      "label": null,
      "game_time": 1474,
      "result": null,
      "status": "NotHappened",
      "message": "Result did not happen",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_40_kills",
      "label": null,
      "game_time": 1474,
      "result": null,
      "status": "NotHappened",
      "message": "Result did not happen",
      "predictions": null
    },
    {
      "id": "radiant_team_race_to_50_kills",
      "label": null,
      "game_time": 1474,
      "result": null,
      "status": "NotHappened",
      "message": "Result did not happen",
      "predictions": null
    }
  ]
}
```
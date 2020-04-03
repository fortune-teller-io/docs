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
        "logo": "https://app.fortune-teller.io/api/dota/logo/team/795368055541056205"
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
6. `series`: describes series of matches
    1. `series_id`: the id of the first match in the series defines the series_id
    2. `game_number`: ordinal number inside the series
    3. `dire_wins`: number of games dire have won when current match started
    4. `radiant_wins`: number of games radiant have won when current match started
7. `radiant` and `dire`: describes participating teams
    1. `team_id`: the identifier
    2. `name`: name
    3. `logo`: the logo link, see [section](#logo-api) below
    4. (Optional) `scoreboard`: detailed in-game state, see [section](#Scoreboards) below
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
    "logo": "https://app.fortune-teller.io/api/dota/logo/team/862855679982708969"
  },
  "dire": {
    "team_id": 2163,
    "name": "Team Liquid",
    "logo": "https://app.fortune-teller.io/api/dota/logo/team/785230100972622130"
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

## Scoreboards

It is possible to provide latest detailed scoreboards for its visualisation or marketing activities.

<aside class="notice">
Please contact vendor for providing such capabilities.
</aside>

### Scoreboard structure

1. `players`: General (match related) player info
    1. `account_id`: Unique player account id
    2. `name`: Player nickname
    3. `mmr`: Current Steam Dota 2 MMR value
2. `statistics`: General (match related) team stats
    1. `total_games`: Total amount of games played by team
    2. `avg_kills`: Average amount of kills performed during one map
    3. `avg_deaths`: Average amount of deaths during one map
    4. `avg_assists`: Average amount of assists performed during one map
    5. `avg_last_hits`: Average amount of last hits on creeps performed during one map
    6. `avg_denies`: Average amount of denies performed during one map
    7. `avg_xpm`: Average amount of XPM on one map
    8. `avg_gpm`: Average amount of GPM on one map
    9. `avg_net_worth`: Average amount of newt worth on one map
    10. `winrate`: Winrate value
3. `maps`: Info related to specific map
    1. `map_id`: Unique map id
    2. `players`: Map players info
        1. `account_id`: Unique player account id
        2. `name`: Player name
        3. `games_played_with_hero`: Total amount of games played with this hero
        4. `games_won_with_hero`: Total amount of games won with this hero
        5. `hero`: Selected hero in current map
            1. `hero_id`: Hero id. Should be used for assets resources collection, see [section](#assets-api) below
            2. `name`: Hero name
            3. `primary_attribute`: Hero primary attribute
            4. `attack_type`: Hero attack type
            5. `roles`: List of hero prefered roles
        6. `kills`: Player's kills number
        7. `deaths`: Player's deaths number
        8. `assists`: Player's assists number
        9. `gpm`: Player's GPM
        10. `xpm`: Player's XPM
        11. `level`: Player's hero level
        12. `net_worth`: Player's net worth
        13. `last_hits`: Player's last hits number
        14. `denies`: Player's denies number
        15. `gold`: Player's gold amount
        16. `ultimate_state`: Player's ultimate state
        17. `ultimate_cooldown`: Player's ultimate cooldown
        18. `respawn_timer`: Player's respawn timer
        19. `position_x`: Player's X position
        20. `position_y`: Player's Y position
    3. `towers`: Team towers state
        1. `top`: Top lane
            1. `tier1`: Tier 1 tower. Map position:
                * Radiant: { x: -6588, y: 1719 }
                * Dire: { x: -4984, y: 5805 }
            2. `tier2`: Tier 2 tower. Map position:
                * Radiant: { x: -6588, y: -978 }
                * Dire: { x: -294, y: 5794 }
            3. `tier3`: Tier 3 tower. Map position:
                * Radiant: { x: -6888, y: -3489 }
                * Dire: { x: 3236, y: 5571 }
        2. `middle`: Middle lane
            1. `tier1`: Tier 1 tower. Map position:
                * Radiant: { x: -1861, y: -1398 }
                * Dire: { x: 157, y: 89 }
            2. `tier2`: Tier 2 tower. Map position:
                * Radiant: { x: -3500, y: -3339 }
                * Dire: { x: 2160, y: 1777 }
            3. `tier3`: Tier 3 tower. Map position:
                * Radiant: { x: -4945, y: -4445 }
                * Dire: { x: 3913, y: 3413 }
        3. `bottom`: Bottom lane
            1. `tier1`: Tier 1 tower. Map position:
                * Radiant: { x: 4934, y: -6330 }
                * Dire: { x: 5891, y: -1965 }
            2. `tier2`: Tier 2 tower. Map position:
                * Radiant: { x: -111, y: -6544 }
                * Dire: { x: 5891, y: 142 }
            3. `tier3`: Tier 3 tower. Map position:
                * Radiant: { x: -4195, y: -6338 }
                * Dire: { x: 5891, y: 2619 }
        4. `ancient`: Team Ancient towers
            1. `top`: Top ancient tower. Map position:
                * Radiant: { x: -6166, y: -5350 }
                * Dire: { x: 4938, y: 4770 }
            2. `bottom`: Bottom ancient tower. Map position:
                * Radiant: { x: -5732, y: -5660 }
                * Dire: { x: 5300, y: 4413 }
    4. `barracks`: Team barrack state
        1. `top`: Top lane barrack
            1. `melee`: Melee top lane barrack. Map position:
                * Radiant: { x: -7148, y: -4067 }
                * Dire: { x: 3782, y: 5837 }
            2. `ranged`: Ranged top lane barrack. Map position:
                * Radiant: { x: -6649, y: -4067 }
                * Dire: { x: 3782, y: 5259 }
        2. `middle`: Middle lane barrack
            1. `melee`: Melee middle lane barrack. Map position:
                * Radiant: { x: -5577, y: -4736 }
                * Dire: { x: 4154, y: 3965 }
            2. `ranged`: Ranged middle lane barrack. Map position:
                * Radiant: { x: -5178, y: -5082 }
                * Dire: { x: 4588, y: 3557 }
        3. `bottom`: Bottom lane barrack
            1. `melee`: Melee bottom lane barrack. Map position:
                * Radiant: { x: -4800, y: -5984 }
                * Dire: { x: 6207, y: 3266 }
            2. `ranged`: Ranged bottom lane barrack. Map position:
                * Radiant: { x: -4800, y: -6479 }
                * Dire: { x: 5579, y: 3266 }

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

> The above command returns JSON structured like this (if scoreboards are enable):

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
    "logo": null,
    "scoreboard": {
      "players": [
        {
          "account_id": 19672354,
          "name": "N0tail",
          "mmr": 8502
        },
        {
          "account_id": 311360822,
          "name": "ana",
          "mmr": 7978
        },
        {
          "account_id": 26771994,
          "name": "JerAx",
          "mmr": 8505
        },
        {
          "account_id": 88271237,
          "name": "Ceb",
          "mmr": 8504
        },
        {
          "account_id": 94054712,
          "name": "Topson",
          "mmr": 8491
        }
      ],
      "statistics": {
        "total_games": 0,
        "avg_kills": 0,
        "avg_deaths": 0,
        "avg_assists": 0,
        "avg_last_hits": 0,
        "avg_denies": 0,
        "avg_xpm": 0,
        "avg_gpm": 0,
        "avg_net_worth": 0,
        "winrate": 0
      },
      "maps": [
        {
          "map_id": 4986461644,
          "towers": {
            "top": {
              "tier1": false,
              "tier2": false,
              "tier3": true
            },
            "middle": {
              "tier1": false,
              "tier2": true,
              "tier3": true
            },
            "bottom": {
              "tier1": false,
              "tier2": true,
              "tier3": true
            },
            "ancient": {
              "top": true,
              "bottom": true
            }
          },
          "barracks": {
            "top": {
              "melee": true,
              "range": true
            },
            "middle": {
              "melee": true,
              "range": true
            },
            "bottom": {
              "melee": true,
              "range": true
            }
          },
          "players": [
            {
              "account_id": 19672354,
              "kills": 3,
              "deaths": 3,
              "assists": 11,
              "gpm": 239,
              "xpm": 352,
              "level": 13,
              "net_worth": 3747,
              "last_hits": 17,
              "denies": 3,
              "gold": 1127,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 3586.15625,
              "position_y": 4548.5,
              "items": [
                {
                  "item_id": 11,
                  "name": "item_quelling_blade"
                },
                {
                  "item_id": 43,
                  "name": "item_ward_sentry"
                },
                {
                  "item_id": 188,
                  "name": "item_smoke_of_deceit"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 214,
                  "name": "item_tranquil_boots"
                },
                {
                  "item_id": 181,
                  "name": "item_orb_of_venom"
                }
              ],
              "name": "N0tail",
              "games_played_with_hero": 26,
              "games_won_with_hero": 18,
              "hero": {
                "hero_id": 102,
                "name": "npc_dota_hero_abaddon",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Support",
                  "Carry",
                  "Durable"
                ]
              }
            },
            {
              "account_id": 311360822,
              "kills": 3,
              "deaths": 1,
              "assists": 16,
              "gpm": 461,
              "xpm": 603,
              "level": 18,
              "net_worth": 11068,
              "last_hits": 182,
              "denies": 3,
              "gold": 993,
              "ultimate_state": 1,
              "ultimate_cooldown": 38,
              "respawn_timer": 0,
              "position_x": 5899.21875,
              "position_y": 6142.90625,
              "items": [
                {
                  "item_id": 166,
                  "name": "item_maelstrom"
                },
                {
                  "item_id": 164,
                  "name": "item_helm_of_the_dominator"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 88,
                  "name": "item_ring_of_basilius"
                },
                {
                  "item_id": 108,
                  "name": "item_ultimate_scepter"
                }
              ],
              "name": "ana",
              "games_played_with_hero": 61,
              "games_won_with_hero": 53,
              "hero": {
                "hero_id": 91,
                "name": "npc_dota_hero_wisp",
                "primary_attribute": "Str",
                "attack_type": "Ranged",
                "roles": [
                  "Support",
                  "Escape",
                  "Nuker"
                ]
              }
            },
            {
              "account_id": 26771994,
              "kills": 2,
              "deaths": 3,
              "assists": 13,
              "gpm": 251,
              "xpm": 396,
              "level": 14,
              "net_worth": 5877,
              "last_hits": 34,
              "denies": 1,
              "gold": 2277,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 4118.59375,
              "position_y": 5337.59375,
              "items": [
                {
                  "item_id": 1,
                  "name": "item_blink"
                },
                {
                  "item_id": 41,
                  "name": "item_bottle"
                },
                {
                  "item_id": 34,
                  "name": "item_magic_stick"
                },
                {
                  "item_id": 29,
                  "name": "item_boots"
                }
              ],
              "name": "JerAx",
              "games_played_with_hero": 26,
              "games_won_with_hero": 13,
              "hero": {
                "hero_id": 19,
                "name": "npc_dota_hero_tiny",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Carry",
                  "Nuker",
                  "Pusher",
                  "Initiator",
                  "Durable",
                  "Disabler"
                ]
              }
            },
            {
              "account_id": 88271237,
              "kills": 2,
              "deaths": 3,
              "assists": 9,
              "gpm": 431,
              "xpm": 500,
              "level": 16,
              "net_worth": 9777,
              "last_hits": 156,
              "denies": 6,
              "gold": 2017,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 4340.96875,
              "position_y": 4743.8125,
              "items": [
                {
                  "item_id": 178,
                  "name": "item_soul_ring"
                },
                {
                  "item_id": 231,
                  "name": "item_guardian_greaves"
                },
                {
                  "item_id": 182,
                  "name": "item_stout_shield"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 244,
                  "name": "item_wind_lace"
                },
                {
                  "item_id": 73,
                  "name": "item_bracer"
                }
              ],
              "name": "Ceb",
              "games_played_with_hero": 128,
              "games_won_with_hero": 53,
              "hero": {
                "hero_id": 98,
                "name": "npc_dota_hero_shredder",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Nuker",
                  "Durable",
                  "Escape"
                ]
              }
            },
            {
              "account_id": 94054712,
              "kills": 10,
              "deaths": 2,
              "assists": 7,
              "gpm": 593,
              "xpm": 605,
              "level": 18,
              "net_worth": 14077,
              "last_hits": 201,
              "denies": 21,
              "gold": 1737,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 3476.8125,
              "position_y": 5313.9375,
              "items": [
                {
                  "item_id": 108,
                  "name": "item_ultimate_scepter"
                },
                {
                  "item_id": 63,
                  "name": "item_power_treads"
                },
                {
                  "item_id": 174,
                  "name": "item_diffusal_blade"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 185,
                  "name": "item_ancient_janggo"
                },
                {
                  "item_id": 26,
                  "name": "item_lifesteal"
                }
              ],
              "name": "Topson",
              "games_played_with_hero": 110,
              "games_won_with_hero": 60,
              "hero": {
                "hero_id": 72,
                "name": "npc_dota_hero_gyrocopter",
                "primary_attribute": "Agi",
                "attack_type": "Ranged",
                "roles": [
                  "Carry",
                  "Nuker",
                  "Disabler"
                ]
              }
            }
          ]
        }
      ]
    }
  },
  "dire": {
    "team_id": 2163,
    "name": "Team Liquid",
    "logo": null,
    "scoreboard": {
      "players": [
        {
          "account_id": 105248644,
          "name": "Miracle-",
          "mmr": 8252
        },
        {
          "account_id": 34505203,
          "name": "MinD_ContRoL",
          "mmr": 8252
        },
        {
          "account_id": 82262664,
          "name": "KuroKy",
          "mmr": 8252
        },
        {
          "account_id": 101356886,
          "name": "Gh",
          "mmr": 7666
        },
        {
          "account_id": 86700461,
          "name": "w33",
          "mmr": 8230
        }
      ],
      "statistics": {
        "total_games": 0,
        "avg_kills": 0,
        "avg_deaths": 0,
        "avg_assists": 0,
        "avg_last_hits": 0,
        "avg_denies": 0,
        "avg_xpm": 0,
        "avg_gpm": 0,
        "avg_net_worth": 0,
        "winrate": 0
      },
      "maps": [
        {
          "map_id": 4986461644,
          "towers": {
            "top": {
              "tier1": false,
              "tier2": false,
              "tier3": true
            },
            "middle": {
              "tier1": false,
              "tier2": true,
              "tier3": true
            },
            "bottom": {
              "tier1": false,
              "tier2": true,
              "tier3": true
            },
            "ancient": {
              "top": true,
              "bottom": true
            }
          },
          "barracks": {
            "top": {
              "melee": true,
              "range": true
            },
            "middle": {
              "melee": true,
              "range": true
            },
            "bottom": {
              "melee": true,
              "range": true
            }
          },
          "players": [
            {
              "account_id": 19672354,
              "kills": 3,
              "deaths": 3,
              "assists": 11,
              "gpm": 239,
              "xpm": 352,
              "level": 13,
              "net_worth": 3747,
              "last_hits": 17,
              "denies": 3,
              "gold": 1127,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 3586.15625,
              "position_y": 4548.5,
              "items": [
                {
                  "item_id": 11,
                  "name": "item_quelling_blade"
                },
                {
                  "item_id": 43,
                  "name": "item_ward_sentry"
                },
                {
                  "item_id": 188,
                  "name": "item_smoke_of_deceit"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 214,
                  "name": "item_tranquil_boots"
                },
                {
                  "item_id": 181,
                  "name": "item_orb_of_venom"
                }
              ],
              "name": "N0tail",
              "games_played_with_hero": 26,
              "games_won_with_hero": 18,
              "hero": {
                "hero_id": 102,
                "name": "npc_dota_hero_abaddon",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Support",
                  "Carry",
                  "Durable"
                ]
              }
            },
            {
              "account_id": 311360822,
              "kills": 3,
              "deaths": 1,
              "assists": 16,
              "gpm": 461,
              "xpm": 603,
              "level": 18,
              "net_worth": 11068,
              "last_hits": 182,
              "denies": 3,
              "gold": 993,
              "ultimate_state": 1,
              "ultimate_cooldown": 38,
              "respawn_timer": 0,
              "position_x": 5899.21875,
              "position_y": 6142.90625,
              "items": [
                {
                  "item_id": 166,
                  "name": "item_maelstrom"
                },
                {
                  "item_id": 164,
                  "name": "item_helm_of_the_dominator"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 88,
                  "name": "item_ring_of_basilius"
                },
                {
                  "item_id": 108,
                  "name": "item_ultimate_scepter"
                }
              ],
              "name": "ana",
              "games_played_with_hero": 61,
              "games_won_with_hero": 53,
              "hero": {
                "hero_id": 91,
                "name": "npc_dota_hero_wisp",
                "primary_attribute": "Str",
                "attack_type": "Ranged",
                "roles": [
                  "Support",
                  "Escape",
                  "Nuker"
                ]
              }
            },
            {
              "account_id": 26771994,
              "kills": 2,
              "deaths": 3,
              "assists": 13,
              "gpm": 251,
              "xpm": 396,
              "level": 14,
              "net_worth": 5877,
              "last_hits": 34,
              "denies": 1,
              "gold": 2277,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 4118.59375,
              "position_y": 5337.59375,
              "items": [
                {
                  "item_id": 1,
                  "name": "item_blink"
                },
                {
                  "item_id": 41,
                  "name": "item_bottle"
                },
                {
                  "item_id": 34,
                  "name": "item_magic_stick"
                },
                {
                  "item_id": 29,
                  "name": "item_boots"
                }
              ],
              "name": "JerAx",
              "games_played_with_hero": 26,
              "games_won_with_hero": 13,
              "hero": {
                "hero_id": 19,
                "name": "npc_dota_hero_tiny",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Carry",
                  "Nuker",
                  "Pusher",
                  "Initiator",
                  "Durable",
                  "Disabler"
                ]
              }
            },
            {
              "account_id": 88271237,
              "kills": 2,
              "deaths": 3,
              "assists": 9,
              "gpm": 431,
              "xpm": 500,
              "level": 16,
              "net_worth": 9777,
              "last_hits": 156,
              "denies": 6,
              "gold": 2017,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 4340.96875,
              "position_y": 4743.8125,
              "items": [
                {
                  "item_id": 178,
                  "name": "item_soul_ring"
                },
                {
                  "item_id": 231,
                  "name": "item_guardian_greaves"
                },
                {
                  "item_id": 182,
                  "name": "item_stout_shield"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 244,
                  "name": "item_wind_lace"
                },
                {
                  "item_id": 73,
                  "name": "item_bracer"
                }
              ],
              "name": "Ceb",
              "games_played_with_hero": 128,
              "games_won_with_hero": 53,
              "hero": {
                "hero_id": 98,
                "name": "npc_dota_hero_shredder",
                "primary_attribute": "Str",
                "attack_type": "Melee",
                "roles": [
                  "Nuker",
                  "Durable",
                  "Escape"
                ]
              }
            },
            {
              "account_id": 94054712,
              "kills": 10,
              "deaths": 2,
              "assists": 7,
              "gpm": 593,
              "xpm": 605,
              "level": 18,
              "net_worth": 14077,
              "last_hits": 201,
              "denies": 21,
              "gold": 1737,
              "ultimate_state": 3,
              "ultimate_cooldown": 0,
              "respawn_timer": 0,
              "position_x": 3476.8125,
              "position_y": 5313.9375,
              "items": [
                {
                  "item_id": 108,
                  "name": "item_ultimate_scepter"
                },
                {
                  "item_id": 63,
                  "name": "item_power_treads"
                },
                {
                  "item_id": 174,
                  "name": "item_diffusal_blade"
                },
                {
                  "item_id": 36,
                  "name": "item_magic_wand"
                },
                {
                  "item_id": 185,
                  "name": "item_ancient_janggo"
                },
                {
                  "item_id": 26,
                  "name": "item_lifesteal"
                }
              ],
              "name": "Topson",
              "games_played_with_hero": 110,
              "games_won_with_hero": 60,
              "hero": {
                "hero_id": 72,
                "name": "npc_dota_hero_gyrocopter",
                "primary_attribute": "Agi",
                "attack_type": "Ranged",
                "roles": [
                  "Carry",
                  "Nuker",
                  "Disabler"
                ]
              }
            }
          ]
        }
      ]
    }
  },
  "streams": [],
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

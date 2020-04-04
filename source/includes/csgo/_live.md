## [CSGO] Live games API

```shell
curl --request GET \
  --url 'https://app.fortune-teller.io/api/csgo/live' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/csgo/live',
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
      "match_id": 2340549,
      "state": "Ended",
      "started_at": "2020-04-04T12:37:36.175Z",
      "league": {
        "league_id": 5226,
        "name": "ESL Pro League Season 11 Europe",
        "logo": "https://static.hltv.org/images/eventLogos/5226.png"
      },
      "series": {
        "series_id": 2340549,
        "game_number": 2,
        "team_1_wins": 1,
        "team_2_wins": 0
      },
      "team_1": {
        "team_id": 6667,
        "name": "FaZe",
        "logo": "https://static.hltv.org/images/team/logo/6667"
      },
      "team_2": {
        "team_id": 8135,
        "name": "forZe",
        "logo": "https://static.hltv.org/images/team/logo/8135"
      },
      "markets": [
        {
          "id": "team_1_map_win",
          "map_number": 0,
          "map_id": 0,
          "label": "Winner (Map 0)",
          "round": 0,
          "result": null,
          "status": "Open",
          "message": "Initial point is set",
          "predictions": [
            {
              "outcome": 1,
              "label": "FaZe",
              "probability": 0.5,
              "odds": 1.87,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 0,
              "label": "forZe",
              "probability": 0.5,
              "odds": 1.87,
              "is_locked": false,
              "lock_reason": null
            }
          ]
        },
        {
          "id": "team_1_match_win",
          "map_number": 0,
          "map_id": 0,
          "label": "Match winner",
          "round": 46,
          "result": {
            "outcome": 1,
            "label": "FaZe"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "odd_even_total_map_rounds",
          "map_number": 0,
          "map_id": 0,
          "label": "Total rounds will be odd or even (Map 0)",
          "round": 0,
          "result": null,
          "status": "Open",
          "message": "Initial point is set",
          "predictions": [
            {
              "outcome": 1,
              "label": "Odd total rounds",
              "probability": 0.5,
              "odds": 1.87,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 0,
              "label": "Even total rounds",
              "probability": 0.5,
              "odds": 1.87,
              "is_locked": false,
              "lock_reason": null
            }
          ]
        },
        {
          "id": "team_1_map_win",
          "map_number": 1,
          "map_id": 1586003880756,
          "label": "Winner (Map 1)",
          "round": 20,
          "result": {
            "outcome": 1,
            "label": "FaZe"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "odd_even_total_map_rounds",
          "map_number": 1,
          "map_id": 1586003880756,
          "label": "Total rounds will be odd or even (Map 1)",
          "round": 20,
          "result": {
            "outcome": 0,
            "label": "Even total rounds"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "team_1_map_win",
          "map_number": 2,
          "map_id": 1586007153434,
          "label": "Winner (Map 2)",
          "round": 26,
          "result": {
            "outcome": 1,
            "label": "FaZe"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        },
        {
          "id": "odd_even_total_map_rounds",
          "map_number": 2,
          "map_id": 1586007153434,
          "label": "Total rounds will be odd or even (Map 2)",
          "round": 26,
          "result": {
            "outcome": 0,
            "label": "Even total rounds"
          },
          "status": "Resolved",
          "message": "Market resolved successfully",
          "predictions": null
        }
      ]
    },
    {
      "match_id": 2340618,
      "state": "Ready",
      "started_at": "2020-04-04T14:22:39.2439997Z",
      "league": {
        "league_id": 5276,
        "name": "LOOT.BET Season 6 Closed Qualifier",
        "logo": "https://static.hltv.org/images/eventLogos/5276.png"
      },
      "series": {
        "series_id": 2340618,
        "game_number": 1,
        "team_1_wins": 0,
        "team_2_wins": 0
      },
      "team_1": {
        "team_id": 10488,
        "name": "Secret",
        "logo": "https://static.hltv.org/images/team/logo/10488"
      },
      "team_2": {
        "team_id": 6978,
        "name": "Singularity",
        "logo": "https://static.hltv.org/images/team/logo/6978"
      },
      "markets": [
        {
          "id": "team_1_map_win",
          "map_number": 1,
          "map_id": 1586010684835,
          "label": "Winner (Map 1)",
          "round": 4,
          "result": null,
          "status": "Open",
          "message": "No reason to put on hold found",
          "predictions": [
            {
              "outcome": 0,
              "label": "Singularity",
              "probability": 0.566435228,
              "odds": 1.66,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 1,
              "label": "Secret",
              "probability": 0.433564772,
              "odds": 2.13,
              "is_locked": false,
              "lock_reason": null
            }
          ]
        },
        {
          "id": "odd_even_total_map_rounds",
          "map_number": 1,
          "map_id": 1586010684835,
          "label": "Total rounds will be odd or even (Map 1)",
          "round": 0,
          "result": null,
          "status": "Open",
          "message": "Initial point is set",
          "predictions": [
            {
              "outcome": 1,
              "label": "Odd total rounds",
              "probability": 0.5,
              "odds": 1.87,
              "is_locked": false,
              "lock_reason": null
            },
            {
              "outcome": 0,
              "label": "Even total rounds",
              "probability": 0.5,
              "odds": 1.87,
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

### Match structure

1. `match_id`: the identifier
3. `state`: describes match state, see [section](#csgo-match-state) below
4. `started_at`: first time when the match was observed, usually when warmup stage started
5. `league`: describes league the match belongs to
    1. `league_id`: the identifier
    2. `name`: name of the league
    3. `logo`: link to league logo (png)
6. `series`: describes series of matches
    1. `series_id`: the id of the first match in the series defines the series_id
    2. `game_number`: ordinal number inside the series
    3. `team_1_wins`: number of games team 1 have won when current match started
    4. `team_2_wins`: number of games team 2 have won when current match started
7. `team_1` and `team_2`: describes participating teams
    1. `team_id`: the identifier
    2. `name`: name
    3. `logo`: the logo link
    4. (Optional) `scoreboard`: detailed in-game state, see [section](#csgo-scoreboards) below
8. `streams`: describes live streams taht were resolved for particular match
    1. `url`: the url of the steam
    2. `title`: either setup or generated title of the stream
    3. `type`: used to describe the source of the stream, see [section](#csgo-stream-types) below
9. `markets`: desribes available markets
    1. `id`: identifier of the market, see [section](#csgo-markets) below
    2. `map_number`: Map number market related to
    3. `map_id`: Map id market related to
    4. `label`: human readable market label
    5. `round`: the in-game round of prediction or result
    6. `status`: market status, see [section](#csgo-market-status) below
    7. `message`: human-readable explanation of why market is in specified state
    8. `result`: describes the outcome of the market, can be null
        1. `outcome`: describes the numeric outcome
        2. `label`: human-readable description of outcome
    9. `predictions`: market predictions
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

### [CSGO] Stream types

Stream type can have following values:

| **Value**   | **Description** |
| ---         | ---             |
| `twitch`    | To match the twitch stream to match the stream title is tested to contain at least one team name stripped from any non alphanumerical symbols or if none were matched contains the name of league

<aside class="warning">
The correctness of the live streams is not guaranteed. There can be both cases of missing streams and streams that were resolved incorrectly. The matching logic is subject to change, but as with any algorithm it can not be guaranteed to cover all possible cases.
</aside>

### [CSGO] Match state

Match state can have following valued:

| **Value**           | **Description** |
| ---                 | ---             |
| `Ready`             | The match is ready and being traded
| `Ended`             | The match end result have been observed. 
| `WaitingForReplayParse` | To address ambuguity and overcome fundamental data source we process replays. This will resolve all markets that have not been resolved during match being live. The match will transition to this state when replay url will be determined and will stay in it until file is processed.
| `ReplayNotAvailable` | There are rare cases when match replay was not recorded and is not available. Is such cases unresolved markets will be marked as `NotHappened`. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ResultNotAvailable` | Tha match should be considered invalid. This is an observable side effect from underlying data source. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ReplayParsed`       | Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.

### [CSGO] Markets

Market id can have following values:

| **Value**                  |**Outcomes**            | **Description** |
| ---                        |  ---                   | ---             |
| `team_1_map_win`           |0 - team 2<br>1 - team 1| Team 1 will win given map
| `team_1_match_win`         |0 - team 2<br>1 - team 1| Team 1 will win match
| `team_1_first_half_win`    |0 - team 2<br>1 - team 1| Team 1 will score more rounds in first half of given map
| `team_1_second_half_win`   |0 - team 2<br>1 - team 1| Team 1 will score more rounds in second half of given map
| `team_1_round_1_win`       |0 - team 2<br>1 - team 1| Team 1 will win 1st round on given map
| `team_1_round_5_win`       |0 - team 2<br>1 - team 1| Team 1 will win 5th round on given map
| `team_1_round_10_win`      |0 - team 2<br>1 - team 1| Team 1 will win 10th round on given map
| `team_1_round_16_win`      |0 - team 2<br>1 - team 1| Team 1 will win 16th round on given map
| `team_1_round_20_win`      |0 - team 2<br>1 - team 1| Team 1 will win 20th round on given map
| `team_1_round_25_win`      |0 - team 2<br>1 - team 1| Team 1 will win 25th round on given map
| `team_1_race_to_5_rounds`  |0 - team 2<br>1 - team 1| Team 1 will be first to score 5 rounds on given map
| `team_1_race_to_10_rounds` |0 - team 2<br>1 - team 1| Team 1 will be first to score 10 rounds on given map
| `team_1_race_to_15_rounds` |0 - team 2<br>1 - team 1| Team 1 will be first to score 15 rounds on given map
| `total_rounds_225`         |0 - under<br>1 - over   | Total rounds will exceed 22.5 on given map
| `total_rounds_235`         |0 - under<br>1 - over   | Total rounds will exceed 23.5 on given map
| `total_rounds_245`         |0 - under<br>1 - over   | Total rounds will exceed 24.5 on given map
| `total_rounds_255`         |0 - under<br>1 - over   | Total rounds will exceed 25.5 on given map
| `total_rounds_265`         |0 - under<br>1 - over   | Total rounds will exceed 26.5 on given map
| `total_rounds_275`         |0 - under<br>1 - over   | Total rounds will exceed 27.5 on given map
| `total_maps_25`            |0 - under<br>1 - over   | Total maps will exceed 2.5
| `total_maps_35`            |0 - under<br>1 - over   | Total maps will exceed 3.5
| `total_maps_45`            |0 - under<br>1 - over   | Total maps will exceed 4.5
| `will_be_overtime`         |0 - no<br>1 - yes       | There will be overtime on given map
| `odd_even_total_map_rounds`|0 - even<br>1 - odd     | Total rounds will be odd on given map

---

### [CSGO] Market status

Market status can have following values:

| **Value**           | **Description** |
| ---                 | ---             |
| `Open`              | The market is open and is recommended to be traded
| `OnHold`            | The market is put on hold due to market template configuration and is recommended not to be traded
| `WaitingForResult`  | Some data sources can not provide enough information to resolve market in real-time (due to absence of data or not enough resolution). The result will be available after replay parse
| `Resolved`          | Market is resolved successfully
| `NotHappened`       | None of the market outcomes occurred and market is recommended to be refunded

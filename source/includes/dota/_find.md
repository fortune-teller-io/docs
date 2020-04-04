## [Dota] Find match API

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

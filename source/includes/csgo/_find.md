## [CSGO] Find match API

It is possible to access match by its identifier. The API works both for live and ended matches.

<aside class="notice">
The API will return only results for the markets that were configured in the market templates on the time the match was traded.
</aside>

<aside class="notice">
The matches are persited for one year after end date.
</aside>

```shell
curl --request GET \
  --url 'https://app.fortune-teller.io/api/csgo/match/2340607' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/csgo/match/2340607',
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
  "match_id": 2340607,
  "state": "ParseCompleted",
  "started_at": "2020-04-03T10:01:35.339Z",
  "league": {
    "league_id": 5276,
    "name": "LOOT.BET Season 6 Closed Qualifier",
    "logo": "https://static.hltv.org/images/eventLogos/5276.png"
  },
  "series": {
    "series_id": 2340607,
    "game_number": 3,
    "team_1_wins": 2,
    "team_2_wins": 1
  },
  "team_1": {
    "team_id": 6978,
    "name": "Singularity",
    "logo": "https://static.hltv.org/images/team/logo/6978",
  },
  "team_2": {
    "team_id": 10693,
    "name": "Mustang Crew",
    "logo": "https://static.hltv.org/images/team/logo/10693",
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
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
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
      "round": 92,
      "result": {
        "outcome": 1,
        "label": "Singularity"
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
          "outcome": 0,
          "label": "Even total rounds",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Odd total rounds",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "will_be_overtime",
      "map_number": 0,
      "map_id": 0,
      "label": "There will be overtime (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "No",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Yes",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_225",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 22.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 22.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 22.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_235",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 23.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 23.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 23.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_245",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 24.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 24.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 24.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_255",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 25.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 25.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 25.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_265",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 26.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 26.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 26.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_rounds_275",
      "map_number": 0,
      "map_id": 0,
      "label": "Total rounds 27.5 (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Under 27.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Over 27.5",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "total_maps_25",
      "map_number": 0,
      "map_id": 0,
      "label": "Total maps 2.5",
      "round": 92,
      "result": {
        "outcome": 1,
        "label": "Over 2.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_maps_35",
      "map_number": 0,
      "map_id": 0,
      "label": "Total maps 3.5",
      "round": 92,
      "result": {
        "outcome": 0,
        "label": "Under 3.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_maps_45",
      "map_number": 0,
      "map_id": 0,
      "label": "Total maps 4.5",
      "round": 92,
      "result": {
        "outcome": 0,
        "label": "Under 4.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_first_half_win",
      "map_number": 0,
      "map_id": 0,
      "label": "First half winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_second_half_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Second half winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_round_1_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Round 1 winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_round_5_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Round 5 winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_round_16_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Round 16 winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_round_20_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Round 20 winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_round_25_win",
      "map_number": 0,
      "map_id": 0,
      "label": "Round 25 winner (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_race_to_5_rounds",
      "map_number": 0,
      "map_id": 0,
      "label": "Race to 5 rounds (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_race_to_10_rounds",
      "map_number": 0,
      "map_id": 0,
      "label": "Race to 10 rounds (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_race_to_15_rounds",
      "map_number": 0,
      "map_id": 0,
      "label": "Race to 15 rounds (Map 0)",
      "round": 0,
      "result": null,
      "status": "Open",
      "message": "Initial point is set",
      "predictions": [
        {
          "outcome": 0,
          "label": "Mustang Crew",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Singularity",
          "probability": 0.5,
          "odds": 2,
          "is_locked": false,
          "lock_reason": null
        }
      ]
    },
    {
      "id": "team_1_map_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Winner (Map 1)",
      "round": 28,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "odd_even_total_map_rounds",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds will be odd or even (Map 1)",
      "round": 28,
      "result": {
        "outcome": 0,
        "label": "Even total rounds"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "will_be_overtime",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "There will be overtime (Map 1)",
      "round": 31,
      "result": {
        "outcome": 0,
        "label": "No"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_225",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 22.5 (Map 1)",
      "round": 23,
      "result": {
        "outcome": 1,
        "label": "Over 22.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_235",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 23.5 (Map 1)",
      "round": 24,
      "result": {
        "outcome": 1,
        "label": "Over 23.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_245",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 24.5 (Map 1)",
      "round": 25,
      "result": {
        "outcome": 1,
        "label": "Over 24.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_255",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 25.5 (Map 1)",
      "round": 26,
      "result": {
        "outcome": 1,
        "label": "Over 25.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_265",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 26.5 (Map 1)",
      "round": 27,
      "result": {
        "outcome": 1,
        "label": "Over 26.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_275",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Total rounds 27.5 (Map 1)",
      "round": 28,
      "result": {
        "outcome": 1,
        "label": "Over 27.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_first_half_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "First half winner (Map 1)",
      "round": 15,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_second_half_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Second half winner (Map 1)",
      "round": 30,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_1_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Round 1 winner (Map 1)",
      "round": 1,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_5_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Round 5 winner (Map 1)",
      "round": 5,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_16_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Round 16 winner (Map 1)",
      "round": 16,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_20_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Round 20 winner (Map 1)",
      "round": 20,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_25_win",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Round 25 winner (Map 1)",
      "round": 25,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_5_rounds",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Race to 5 rounds (Map 1)",
      "round": 9,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_10_rounds",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Race to 10 rounds (Map 1)",
      "round": 15,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_15_rounds",
      "map_number": 1,
      "map_id": 1585908321018,
      "label": "Race to 15 rounds (Map 1)",
      "round": 26,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_map_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Winner (Map 2)",
      "round": 30,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "odd_even_total_map_rounds",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds will be odd or even (Map 2)",
      "round": 30,
      "result": {
        "outcome": 0,
        "label": "Even total rounds"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "will_be_overtime",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "There will be overtime (Map 2)",
      "round": 31,
      "result": {
        "outcome": 0,
        "label": "No"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_225",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 22.5 (Map 2)",
      "round": 23,
      "result": {
        "outcome": 1,
        "label": "Over 22.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_235",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 23.5 (Map 2)",
      "round": 24,
      "result": {
        "outcome": 1,
        "label": "Over 23.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_245",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 24.5 (Map 2)",
      "round": 25,
      "result": {
        "outcome": 1,
        "label": "Over 24.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_255",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 25.5 (Map 2)",
      "round": 26,
      "result": {
        "outcome": 1,
        "label": "Over 25.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_265",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 26.5 (Map 2)",
      "round": 27,
      "result": {
        "outcome": 1,
        "label": "Over 26.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_275",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Total rounds 27.5 (Map 2)",
      "round": 28,
      "result": {
        "outcome": 1,
        "label": "Over 27.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_first_half_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "First half winner (Map 2)",
      "round": 15,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_second_half_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Second half winner (Map 2)",
      "round": 30,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_1_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Round 1 winner (Map 2)",
      "round": 1,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_5_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Round 5 winner (Map 2)",
      "round": 5,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_16_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Round 16 winner (Map 2)",
      "round": 16,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_20_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Round 20 winner (Map 2)",
      "round": 20,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_25_win",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Round 25 winner (Map 2)",
      "round": 25,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_5_rounds",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Race to 5 rounds (Map 2)",
      "round": 6,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_10_rounds",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Race to 10 rounds (Map 2)",
      "round": 18,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_15_rounds",
      "map_number": 2,
      "map_id": 1585912271197,
      "label": "Race to 15 rounds (Map 2)",
      "round": 29,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_map_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Winner (Map 3)",
      "round": 34,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "odd_even_total_map_rounds",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds will be odd or even (Map 3)",
      "round": 34,
      "result": {
        "outcome": 0,
        "label": "Even total rounds"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "will_be_overtime",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "There will be overtime (Map 3)",
      "round": 31,
      "result": {
        "outcome": 1,
        "label": "Yes"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_225",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 22.5 (Map 3)",
      "round": 23,
      "result": {
        "outcome": 1,
        "label": "Over 22.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_235",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 23.5 (Map 3)",
      "round": 24,
      "result": {
        "outcome": 1,
        "label": "Over 23.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_245",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 24.5 (Map 3)",
      "round": 25,
      "result": {
        "outcome": 1,
        "label": "Over 24.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_255",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 25.5 (Map 3)",
      "round": 26,
      "result": {
        "outcome": 1,
        "label": "Over 25.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_265",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 26.5 (Map 3)",
      "round": 27,
      "result": {
        "outcome": 1,
        "label": "Over 26.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "total_rounds_275",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Total rounds 27.5 (Map 3)",
      "round": 28,
      "result": {
        "outcome": 1,
        "label": "Over 27.5"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_first_half_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "First half winner (Map 3)",
      "round": 15,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_second_half_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Second half winner (Map 3)",
      "round": 30,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_1_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Round 1 winner (Map 3)",
      "round": 1,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_5_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Round 5 winner (Map 3)",
      "round": 5,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_16_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Round 16 winner (Map 3)",
      "round": 16,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_20_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Round 20 winner (Map 3)",
      "round": 20,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_round_25_win",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Round 25 winner (Map 3)",
      "round": 25,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_5_rounds",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Race to 5 rounds (Map 3)",
      "round": 9,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_10_rounds",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Race to 10 rounds (Map 3)",
      "round": 18,
      "result": {
        "outcome": 0,
        "label": "Mustang Crew"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    },
    {
      "id": "team_1_race_to_15_rounds",
      "map_number": 3,
      "map_id": 1585916105775,
      "label": "Race to 15 rounds (Map 3)",
      "round": 29,
      "result": {
        "outcome": 1,
        "label": "Singularity"
      },
      "status": "Resolved",
      "message": "Market resolved successfully",
      "predictions": null
    }
  ]
}
```

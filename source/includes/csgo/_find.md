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
  --url 'https://app.fortune-teller.io/api/csgo/match/4986461644' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/csgo/match/4986461644',
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
    "scoreboard": {
      "statistics": {
        "maps_played": 72,
        "wins": 31,
        "draws": 0,
        "loses": 41,
        "total_kills": 6317,
        "total_deaths": 6595
      },
      "players": [
        {
          "account_id": 3820,
          "maps_played": 42,
          "total_kills": 645,
          "total_deaths": 760,
          "headshot_percentage": 45.4,
          "rating": 0.93
        },
        {
          "account_id": 9895,
          "maps_played": 47,
          "total_kills": 969,
          "total_deaths": 892,
          "headshot_percentage": 36.5,
          "rating": 1.1
        },
        {
          "account_id": 11257,
          "maps_played": 36,
          "total_kills": 646,
          "total_deaths": 642,
          "headshot_percentage": 50.5,
          "rating": 1.03
        },
        {
          "account_id": 13749,
          "maps_played": 46,
          "total_kills": 731,
          "total_deaths": 822,
          "headshot_percentage": 59.9,
          "rating": 0.95
        },
        {
          "account_id": 17956,
          "maps_played": 37,
          "total_kills": 627,
          "total_deaths": 682,
          "headshot_percentage": 60.1,
          "rating": 0.97
        }
      ],
      "maps": [
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 3,
            "wins": 2,
            "draws": 0,
            "loses": 1,
            "total_kills": 270,
            "total_deaths": 274
          },
          "players": [
            {
              "account_id": 3820,
              "name": "TOBIZ",
              "nick": "TOBIZ",
              "score": 20,
              "deaths": 18,
              "assists": 4,
              "damage_per_round": 111.42857142857143,
              "primary_weapon": "ak47",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 3,
              "total_kills": 42,
              "total_deaths": 57,
              "headshot_percentage": 47.6
            },
            {
              "account_id": 9895,
              "name": "mertz",
              "nick": "mertz",
              "score": 27,
              "deaths": 20,
              "assists": 4,
              "damage_per_round": 163.71428571428572,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 3,
              "total_kills": 55,
              "total_deaths": 56,
              "headshot_percentage": 32.7
            },
            {
              "account_id": 11257,
              "name": "Celrate",
              "nick": "Celrate",
              "score": 17,
              "deaths": 16,
              "assists": 5,
              "damage_per_round": 108.46428571428571,
              "primary_weapon": "ak47",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 3,
              "total_kills": 74,
              "total_deaths": 52,
              "headshot_percentage": 50
            },
            {
              "account_id": 13749,
              "name": "Queenix",
              "nick": "Queenix",
              "score": 18,
              "deaths": 18,
              "assists": 9,
              "damage_per_round": 108.42857142857143,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 60,
              "total_deaths": 69,
              "headshot_percentage": 63.3
            },
            {
              "account_id": 17956,
              "name": "Jabbi",
              "nick": "Jabbi",
              "score": 20,
              "deaths": 19,
              "assists": 3,
              "damage_per_round": 99.75,
              "primary_weapon": "ak47",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 3,
              "total_kills": 49,
              "total_deaths": 56,
              "headshot_percentage": 57.1
            }
          ],
          "round_result": {
            "won": false
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 16,
            "wins": 8,
            "draws": 0,
            "loses": 8,
            "total_kills": 1463,
            "total_deaths": 1459
          },
          "players": [
            {
              "account_id": 3820,
              "name": "TOBIZ",
              "nick": "TOBIZ",
              "score": 11,
              "deaths": 23,
              "assists": 2,
              "damage_per_round": 61.53333333333333,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 12,
              "total_kills": 187,
              "total_deaths": 210,
              "headshot_percentage": 42.2
            },
            {
              "account_id": 9895,
              "name": "mertz",
              "nick": "mertz",
              "score": 25,
              "deaths": 20,
              "assists": 0,
              "damage_per_round": 115.8,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 13,
              "total_kills": 271,
              "total_deaths": 256,
              "headshot_percentage": 32.8
            },
            {
              "account_id": 11257,
              "name": "Celrate",
              "nick": "Celrate",
              "score": 21,
              "deaths": 17,
              "assists": 4,
              "damage_per_round": 104.33333333333333,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 11,
              "total_kills": 209,
              "total_deaths": 198,
              "headshot_percentage": 51.7
            },
            {
              "account_id": 13749,
              "name": "Queenix",
              "nick": "Queenix",
              "score": 21,
              "deaths": 20,
              "assists": 4,
              "damage_per_round": 108.8,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 12,
              "total_kills": 203,
              "total_deaths": 215,
              "headshot_percentage": 60.6
            },
            {
              "account_id": 17956,
              "name": "Jabbi",
              "nick": "Jabbi",
              "score": 27,
              "deaths": 22,
              "assists": 5,
              "damage_per_round": 148.26666666666668,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 11,
              "total_kills": 181,
              "total_deaths": 197,
              "headshot_percentage": 59.1
            }
          ],
          "round_result": {
            "won": true,
            "victory_type": "Defused"
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 12,
            "wins": 4,
            "draws": 0,
            "loses": 8,
            "total_kills": 1001,
            "total_deaths": 1075
          },
          "players": [
            {
              "account_id": 3820,
              "name": "TOBIZ",
              "nick": "TOBIZ",
              "score": 14,
              "deaths": 21,
              "assists": 6,
              "damage_per_round": 58.088235294117645,
              "primary_weapon": "m4a1",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 7,
              "total_kills": 102,
              "total_deaths": 118,
              "headshot_percentage": 52
            },
            {
              "account_id": 9895,
              "name": "mertz",
              "nick": "mertz",
              "score": 34,
              "deaths": 21,
              "assists": 2,
              "damage_per_round": 92.97058823529412,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 9,
              "total_kills": 169,
              "total_deaths": 157,
              "headshot_percentage": 40.8
            },
            {
              "account_id": 11257,
              "name": "Celrate",
              "nick": "Celrate",
              "score": 25,
              "deaths": 19,
              "assists": 0,
              "damage_per_round": 75.70588235294117,
              "primary_weapon": "scar20",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 7,
              "total_kills": 105,
              "total_deaths": 111,
              "headshot_percentage": 50.5
            },
            {
              "account_id": 13749,
              "name": "Queenix",
              "nick": "Queenix",
              "score": 21,
              "deaths": 23,
              "assists": 8,
              "damage_per_round": 76.61764705882354,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 8,
              "total_kills": 119,
              "total_deaths": 137,
              "headshot_percentage": 60.5
            },
            {
              "account_id": 17956,
              "name": "Jabbi",
              "nick": "Jabbi",
              "score": 26,
              "deaths": 26,
              "assists": 3,
              "damage_per_round": 86.38235294117646,
              "primary_weapon": "m4a1",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 7,
              "total_kills": 120,
              "total_deaths": 125,
              "headshot_percentage": 60
            }
          ],
          "round_result": {
            "won": true,
            "victory_type": "Annihilation"
          }
        }
      ]
    }
  },
  "team_2": {
    "team_id": 10693,
    "name": "Mustang Crew",
    "logo": "https://static.hltv.org/images/team/logo/10693",
    "scoreboard": {
      "statistics": {
        "maps_played": 2,
        "wins": 0,
        "draws": 0,
        "loses": 2,
        "total_kills": 144,
        "total_deaths": 192
      },
      "players": [
        {
          "account_id": 735,
          "maps_played": 2,
          "total_kills": 31,
          "total_deaths": 38,
          "headshot_percentage": 41.9,
          "rating": 0.9
        },
        {
          "account_id": 8790,
          "maps_played": 12,
          "total_kills": 188,
          "total_deaths": 222,
          "headshot_percentage": 55.3,
          "rating": 0.93
        },
        {
          "account_id": 7427,
          "maps_played": 3,
          "total_kills": 52,
          "total_deaths": 56,
          "headshot_percentage": 55.8,
          "rating": 1.02
        },
        {
          "account_id": 13899,
          "maps_played": 3,
          "total_kills": 41,
          "total_deaths": 59,
          "headshot_percentage": 53.7,
          "rating": 0.76
        },
        {
          "account_id": 2638,
          "maps_played": 3,
          "total_kills": 44,
          "total_deaths": 51,
          "headshot_percentage": 25,
          "rating": 0.9
        }
      ],
      "maps": [
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 1,
            "wins": 0,
            "draws": 0,
            "loses": 1,
            "total_kills": 56,
            "total_deaths": 84
          },
          "players": [
            {
              "account_id": 735,
              "name": "Dosia",
              "nick": "Dosia",
              "score": 18,
              "deaths": 23,
              "assists": 6,
              "damage_per_round": 97.25,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 1,
              "total_kills": 13,
              "total_deaths": 18,
              "headshot_percentage": 30.8
            },
            {
              "account_id": 8790,
              "name": "hutji",
              "nick": "hutji",
              "score": 9,
              "deaths": 20,
              "assists": 4,
              "damage_per_round": 86.82142857142857,
              "primary_weapon": "ak47",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": true,
              "maps_played": 2,
              "total_kills": 27,
              "total_deaths": 33,
              "headshot_percentage": 44.4
            },
            {
              "account_id": 7427,
              "name": "fabi",
              "nick": "fabi",
              "score": 14,
              "deaths": 20,
              "assists": 5,
              "damage_per_round": 86.35714285714286,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 2,
              "total_kills": 28,
              "total_deaths": 33,
              "headshot_percentage": 57.1
            },
            {
              "account_id": 13899,
              "name": "la3euka",
              "nick": "la3euka",
              "score": 0,
              "deaths": 0,
              "assists": 0,
              "damage_per_round": 0,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 1,
              "total_kills": 9,
              "total_deaths": 17,
              "headshot_percentage": 66.7
            },
            {
              "account_id": 2638,
              "name": "Wierd_1k",
              "nick": "Wierd_1k",
              "score": 29,
              "deaths": 21,
              "assists": 3,
              "damage_per_round": 150.71428571428572,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 2,
              "total_kills": 31,
              "total_deaths": 30,
              "headshot_percentage": 29
            }
          ],
          "round_result": {
            "won": true,
            "victory_type": "Annihilation"
          }
        },
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 0,
            "wins": 0,
            "draws": 0,
            "loses": 0,
            "total_kills": 0,
            "total_deaths": 0
          },
          "players": [
            {
              "account_id": 735,
              "name": "Dosia",
              "nick": "Dosia",
              "score": 22,
              "deaths": 19,
              "assists": 3,
              "damage_per_round": 108.03333333333333,
              "primary_weapon": "ak47",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": true,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 8790,
              "name": "hutji",
              "nick": "hutji",
              "score": 27,
              "deaths": 23,
              "assists": 5,
              "damage_per_round": 115.63333333333334,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 2,
              "total_kills": 43,
              "total_deaths": 40,
              "headshot_percentage": 72.1
            },
            {
              "account_id": 7427,
              "name": "fabi",
              "nick": "fabi",
              "score": 25,
              "deaths": 21,
              "assists": 2,
              "damage_per_round": 108.9,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 13899,
              "name": "la3euka",
              "nick": "la3euka",
              "score": 0,
              "deaths": 0,
              "assists": 0,
              "damage_per_round": 0,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 2638,
              "name": "Wierd_1k",
              "nick": "Wierd_1k",
              "score": 7,
              "deaths": 21,
              "assists": 2,
              "damage_per_round": 51.86666666666667,
              "primary_weapon": "awp",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": true,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            }
          ],
          "round_result": {
            "won": false
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 0,
            "wins": 0,
            "draws": 0,
            "loses": 0,
            "total_kills": 0,
            "total_deaths": 0
          },
          "players": [
            {
              "account_id": 735,
              "name": "Dosia",
              "nick": "Dosia",
              "score": 14,
              "deaths": 26,
              "assists": 4,
              "damage_per_round": 59.85294117647059,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 8790,
              "name": "hutji",
              "nick": "hutji",
              "score": 21,
              "deaths": 25,
              "assists": 6,
              "damage_per_round": 65.41176470588235,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 1,
              "total_kills": 6,
              "total_deaths": 18,
              "headshot_percentage": 83.3
            },
            {
              "account_id": 7427,
              "name": "fabi",
              "nick": "fabi",
              "score": 27,
              "deaths": 25,
              "assists": 2,
              "damage_per_round": 80,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 13899,
              "name": "la3euka",
              "nick": null,
              "score": 0,
              "deaths": 0,
              "assists": 0,
              "damage_per_round": 0,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            },
            {
              "account_id": 2638,
              "name": "Wierd_1k",
              "nick": "Wierd_1k",
              "score": 25,
              "deaths": 20,
              "assists": 3,
              "damage_per_round": 75.3529411764706,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 0,
              "total_kills": 0,
              "total_deaths": 0,
              "headshot_percentage": 0
            }
          ],
          "round_result": {
            "won": false
          }
        }
      ]
    }
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

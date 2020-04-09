## [CSGO] Scoreboards

It is possible to provide latest detailed scoreboards for its visualisation or marketing activities.

<aside class="notice">
Please contact vendor for providing such capabilities.
</aside>

### Scoreboard structure

1. `players`: General (match related) player info for last 6 months
    1. `account_id`: Unique player account id
    2. `maps_played`: Amount of maps playerd by player
    3. `total_kills`: Total kills performed
    4. `total_deaths`:  Total player deaths
    5. `headshot_percentage`: Percentage of headshots
    6. `rating`: Player rating
2. `statistics`: General (match related) team stats for last 6 months
  1. `maps_played`: Maps played by team
  2. `wins`: Team wins count
  3. `draws`: Team draws count
  4. `loses`: Team loses count
  5. `total_kills`: Total kills performed by team
  6. `total_deaths`: Total team deaths
3. `maps`: Info related to specific map
    1. `map_id`: Unique map id
    2. `map_name`: Map name, see [section](#csgo-assets-api) below
    3. `map_score`: Current team map score (rounds won)
    4. `round_side`: Current team latest round side on map
    5. `players`: Map players info
        1. `account_id`: Unique player account id
        2. `name`: Player's name
        3. `nick`: Player's nickname
        4. `score`: Kills performed by player
        5. `deaths`: Player's deaths count
        6. `assists`: Player's assists count
        7. `damage_per_round`: Damage performed in latest round by player
        8. `primary_weapon`: Player's primary weapon in latest round, see [section](#csgo-assets-api) below
        9. `has_kevlar`: Whether player had kevlar in latest round, see [section](#csgo-assets-api) below
        10. `has_helmet`: Whether player had helmet in latest round, see [section](#csgo-assets-api) below
        11. `has_defuse_kit`: Whether player had defuse kit in latest round, see [section](#csgo-assets-api) below
        12. `maps_played`: How many times current player played on current map
        13. `total_kills`: How many kills current player performed on current map
        14. `total_deaths`: How many deaths current player had on current map
        15. `headshot_percentage`: Headshot percentage player performed on current map
    6. `statistics`: Map related team statistics
        1. `maps_played`: Maps played by team
        2. `wins`: Team wins count
        3. `draws`: Team draws count
        4. `loses`: Team loses count
        5. `total_kills`: Total kills performed by team
        6. `total_deaths`: Total team deaths
    7. `round_result`: Lates round result
        1. `won`: If team wom latest round
        2. `victory_type`: [Optional] How team won, see [section](#csgo-assets-api) below


```shell
curl --request GET \
  --url 'https://app.fortune-teller.io/api/csgo/match/2340524' \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer access_token'
```

```javascript
var access_token = 'access_token';
var options = {
    method: 'GET',
    url: 'https://app.fortune-teller.io/api/csgo/match/2340524',
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
  "match_id": 2340524,
  "state": "ParseCompleted",
  "started_at": "2020-04-02T20:16:30.184Z",
  "league": {
    "league_id": 5246,
    "name": "ESL Pro League Season 11 North America",
    "logo": "https://static.hltv.org/images/eventLogos/5246.png"
  },
  "series": {
    "series_id": 2340524,
    "game_number": 3,
    "team_1_wins": 1,
    "team_2_wins": 1
  },
  "team_1": {
    "team_id": 10399,
    "name": "Evil Geniuses",
    "logo": "https://static.hltv.org/images/team/logo/10399",
    "scoreboard": {
      "statistics": {
        "maps_played": 103,
        "wins": 59,
        "draws": 0,
        "loses": 44,
        "total_kills": 8899,
        "total_deaths": 8901
      },
      "players": [
        {
          "account_id": 9136,
          "maps_played": 99,
          "total_kills": 1911,
          "total_deaths": 1716,
          "headshot_percentage": 51.4,
          "rating": 1.11
        },
        {
          "account_id": 11219,
          "maps_played": 103,
          "total_kills": 1888,
          "total_deaths": 1688,
          "headshot_percentage": 29,
          "rating": 1.1
        },
        {
          "account_id": 10671,
          "maps_played": 103,
          "total_kills": 1830,
          "total_deaths": 1775,
          "headshot_percentage": 47.7,
          "rating": 1.09
        },
        {
          "account_id": 8523,
          "maps_played": 104,
          "total_kills": 1673,
          "total_deaths": 1853,
          "headshot_percentage": 38.1,
          "rating": 0.98
        },
        {
          "account_id": 8507,
          "maps_played": 103,
          "total_kills": 1556,
          "total_deaths": 1823,
          "headshot_percentage": 49.4,
          "rating": 0.94
        }
      ],
      "maps": [
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 4,
            "wins": 2,
            "draws": 0,
            "loses": 2,
            "total_kills": 341,
            "total_deaths": 373
          },
          "players": [
            {
              "account_id": 9136,
              "name": "Brehze",
              "nick": "Brehze",
              "score": 23,
              "deaths": 19,
              "assists": 4,
              "damage_per_round": 105.63333333333334,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 92,
              "total_deaths": 68,
              "headshot_percentage": 47.8
            },
            {
              "account_id": 11219,
              "name": "CeRq",
              "nick": "CeRq",
              "score": 23,
              "deaths": 22,
              "assists": 4,
              "damage_per_round": 119.16666666666667,
              "primary_weapon": "sg556",
              "has_kevlar": true,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 61,
              "total_deaths": 73,
              "headshot_percentage": 32.8
            },
            {
              "account_id": 10671,
              "name": "Ethan",
              "nick": "Ethan",
              "score": 21,
              "deaths": 24,
              "assists": 5,
              "damage_per_round": 130.1,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 72,
              "total_deaths": 71,
              "headshot_percentage": 47.2
            },
            {
              "account_id": 8523,
              "name": "tarik",
              "nick": "tarik",
              "score": 15,
              "deaths": 22,
              "assists": 3,
              "damage_per_round": 70.3,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 71,
              "total_deaths": 80,
              "headshot_percentage": 33.8
            },
            {
              "account_id": 8507,
              "name": "stanislaw",
              "nick": "stanislaw",
              "score": 16,
              "deaths": 18,
              "assists": 6,
              "damage_per_round": 90.2,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 4,
              "total_kills": 45,
              "total_deaths": 81,
              "headshot_percentage": 35.6
            }
          ],
          "round_result": {
            "won": false
          }
        },
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 18,
            "wins": 9,
            "draws": 0,
            "loses": 9,
            "total_kills": 1573,
            "total_deaths": 1627
          },
          "players": [
            {
              "account_id": 9136,
              "name": "Brehze",
              "nick": "Brehze",
              "score": 32,
              "deaths": 17,
              "assists": 3,
              "damage_per_round": 162.51724137931035,
              "primary_weapon": "m4a1",
              "has_kevlar": true,
              "has_helmet": false,
              "has_defuse_kit": true,
              "maps_played": 18,
              "total_kills": 355,
              "total_deaths": 326,
              "headshot_percentage": 51.5
            },
            {
              "account_id": 11219,
              "name": "CeRq",
              "nick": "CeRq",
              "score": 17,
              "deaths": 16,
              "assists": 3,
              "damage_per_round": 112.58620689655173,
              "primary_weapon": "awp",
              "has_kevlar": true,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 18,
              "total_kills": 304,
              "total_deaths": 306,
              "headshot_percentage": 28.6
            },
            {
              "account_id": 10671,
              "name": "Ethan",
              "nick": "Ethan",
              "score": 19,
              "deaths": 13,
              "assists": 3,
              "damage_per_round": 104.93103448275862,
              "primary_weapon": "awp",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": true,
              "maps_played": 18,
              "total_kills": 307,
              "total_deaths": 329,
              "headshot_percentage": 51.5
            },
            {
              "account_id": 8523,
              "name": "tarik",
              "nick": "tarik",
              "score": 23,
              "deaths": 22,
              "assists": 4,
              "damage_per_round": 118.17241379310344,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 18,
              "total_kills": 316,
              "total_deaths": 346,
              "headshot_percentage": 44
            },
            {
              "account_id": 8507,
              "name": "stanislaw",
              "nick": "stanislaw",
              "score": 13,
              "deaths": 16,
              "assists": 1,
              "damage_per_round": 71.10344827586206,
              "primary_weapon": "m4a1",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 18,
              "total_kills": 291,
              "total_deaths": 320,
              "headshot_percentage": 49.1
            }
          ],
          "round_result": {
            "won": true,
            "victory_type": "Annihilation"
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 25,
            "wins": 16,
            "draws": 0,
            "loses": 9,
            "total_kills": 2158,
            "total_deaths": 2120
          },
          "players": [
            {
              "account_id": 9136,
              "name": "Brehze",
              "nick": "Brehze",
              "score": 14,
              "deaths": 11,
              "assists": 4,
              "damage_per_round": 82.16666666666667,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 24,
              "total_kills": 457,
              "total_deaths": 399,
              "headshot_percentage": 50.1
            },
            {
              "account_id": 11219,
              "name": "CeRq",
              "nick": "CeRq",
              "score": 15,
              "deaths": 13,
              "assists": 4,
              "damage_per_round": 97.91666666666667,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 469,
              "total_deaths": 401,
              "headshot_percentage": 29.2
            },
            {
              "account_id": 10671,
              "name": "Ethan",
              "nick": "Ethan",
              "score": 18,
              "deaths": 12,
              "assists": 8,
              "damage_per_round": 115.375,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 442,
              "total_deaths": 431,
              "headshot_percentage": 49.3
            },
            {
              "account_id": 8523,
              "name": "tarik",
              "nick": "tarik",
              "score": 18,
              "deaths": 13,
              "assists": 0,
              "damage_per_round": 96.79166666666667,
              "primary_weapon": "sg556",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 389,
              "total_deaths": 437,
              "headshot_percentage": 40.4
            },
            {
              "account_id": 8507,
              "name": "stanislaw",
              "nick": "stanislaw",
              "score": 16,
              "deaths": 11,
              "assists": 2,
              "damage_per_round": 93.79166666666667,
              "primary_weapon": "sg556",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 393,
              "total_deaths": 434,
              "headshot_percentage": 49.1
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
    "team_id": 9215,
    "name": "MIBR",
    "logo": "https://static.hltv.org/images/team/logo/9215",
    "scoreboard": {
      "statistics": {
        "maps_played": 109,
        "wins": 57,
        "draws": 0,
        "loses": 52,
        "total_kills": 9534,
        "total_deaths": 9444
      },
      "players": [
        {
          "account_id": 2023,
          "maps_played": 110,
          "total_kills": 1902,
          "total_deaths": 1792,
          "headshot_percentage": 32.9,
          "rating": 1.06
        },
        {
          "account_id": 8564,
          "maps_played": 109,
          "total_kills": 2022,
          "total_deaths": 1935,
          "headshot_percentage": 44.2,
          "rating": 1.07
        },
        {
          "account_id": 9217,
          "maps_played": 109,
          "total_kills": 1738,
          "total_deaths": 1886,
          "headshot_percentage": 54.8,
          "rating": 0.98
        },
        {
          "account_id": 5736,
          "maps_played": 109,
          "total_kills": 2100,
          "total_deaths": 1922,
          "headshot_percentage": 37.6,
          "rating": 1.08
        },
        {
          "account_id": 14737,
          "maps_played": 78,
          "total_kills": 1267,
          "total_deaths": 1324,
          "headshot_percentage": 55.2,
          "rating": 1
        }
      ],
      "maps": [
        {
          "map_score": 0,
          "statistics": {
            "maps_played": 13,
            "wins": 7,
            "draws": 0,
            "loses": 6,
            "total_kills": 1255,
            "total_deaths": 1233
          },
          "players": [
            {
              "account_id": 2023,
              "name": "FalleN",
              "nick": "FalleN",
              "score": 24,
              "deaths": 17,
              "assists": 5,
              "damage_per_round": 150.86666666666667,
              "primary_weapon": "awp",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 13,
              "total_kills": 253,
              "total_deaths": 232,
              "headshot_percentage": 35.6
            },
            {
              "account_id": 8564,
              "name": "fer",
              "nick": "fer",
              "score": 15,
              "deaths": 21,
              "assists": 6,
              "damage_per_round": 89,
              "primary_weapon": "sg556",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 13,
              "total_kills": 256,
              "total_deaths": 258,
              "headshot_percentage": 41
            },
            {
              "account_id": 9217,
              "name": "TACO",
              "nick": "TACO",
              "score": 22,
              "deaths": 21,
              "assists": 4,
              "damage_per_round": 106.33333333333333,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 13,
              "total_kills": 240,
              "total_deaths": 249,
              "headshot_percentage": 54.2
            },
            {
              "account_id": 5736,
              "name": "kNgV-",
              "nick": "kNgV-",
              "score": 24,
              "deaths": 20,
              "assists": 2,
              "damage_per_round": 113.33333333333333,
              "primary_weapon": "sg556",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 13,
              "total_kills": 274,
              "total_deaths": 260,
              "headshot_percentage": 44.9
            },
            {
              "account_id": 14737,
              "name": "meyern",
              "nick": "meyern",
              "score": 19,
              "deaths": 20,
              "assists": 2,
              "damage_per_round": 94.06666666666666,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 9,
              "total_kills": 182,
              "total_deaths": 154,
              "headshot_percentage": 47.3
            }
          ],
          "round_result": {
            "won": true,
            "victory_type": "Annihilation"
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 10,
            "wins": 3,
            "draws": 0,
            "loses": 7,
            "total_kills": 768,
            "total_deaths": 915
          },
          "players": [
            {
              "account_id": 2023,
              "name": "FalleN",
              "nick": "FalleN",
              "score": 21,
              "deaths": 18,
              "assists": 2,
              "damage_per_round": 97.75862068965517,
              "primary_weapon": "awp",
              "has_kevlar": true,
              "has_helmet": true,
              "has_defuse_kit": false,
              "maps_played": 10,
              "total_kills": 174,
              "total_deaths": 179,
              "headshot_percentage": 39.7
            },
            {
              "account_id": 8564,
              "name": "fer",
              "nick": "fer",
              "score": 15,
              "deaths": 23,
              "assists": 4,
              "damage_per_round": 96.65517241379311,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 10,
              "total_kills": 142,
              "total_deaths": 189,
              "headshot_percentage": 47.2
            },
            {
              "account_id": 9217,
              "name": "TACO",
              "nick": "TACO",
              "score": 10,
              "deaths": 20,
              "assists": 5,
              "damage_per_round": 70.34482758620689,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 10,
              "total_kills": 146,
              "total_deaths": 172,
              "headshot_percentage": 48.6
            },
            {
              "account_id": 5736,
              "name": "kNgV-",
              "nick": "kNgV-",
              "score": 21,
              "deaths": 20,
              "assists": 5,
              "damage_per_round": 126.96551724137932,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 10,
              "total_kills": 149,
              "total_deaths": 185,
              "headshot_percentage": 41.6
            },
            {
              "account_id": 14737,
              "name": "meyern",
              "nick": "meyern",
              "score": 17,
              "deaths": 23,
              "assists": 1,
              "damage_per_round": 74.44827586206897,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 8,
              "total_kills": 129,
              "total_deaths": 125,
              "headshot_percentage": 58.9
            }
          ],
          "round_result": {
            "won": false
          }
        },
        {
          "map_score": 1,
          "statistics": {
            "maps_played": 25,
            "wins": 14,
            "draws": 0,
            "loses": 11,
            "total_kills": 2216,
            "total_deaths": 2110
          },
          "players": [
            {
              "account_id": 2023,
              "name": "FalleN",
              "nick": "FalleN",
              "score": 10,
              "deaths": 19,
              "assists": 5,
              "damage_per_round": 80.91666666666667,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 451,
              "total_deaths": 398,
              "headshot_percentage": 31.7
            },
            {
              "account_id": 8564,
              "name": "fer",
              "nick": "fer",
              "score": 13,
              "deaths": 14,
              "assists": 3,
              "damage_per_round": 73.625,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 483,
              "total_deaths": 406,
              "headshot_percentage": 45.1
            },
            {
              "account_id": 9217,
              "name": "TACO",
              "nick": "TACO",
              "score": 10,
              "deaths": 18,
              "assists": 2,
              "damage_per_round": 74.70833333333333,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 390,
              "total_deaths": 438,
              "headshot_percentage": 56.2
            },
            {
              "account_id": 5736,
              "name": "kNgV-",
              "nick": "kNgV-",
              "score": 16,
              "deaths": 16,
              "assists": 3,
              "damage_per_round": 110.83333333333333,
              "primary_weapon": null,
              "has_kevlar": false,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 25,
              "total_kills": 483,
              "total_deaths": 436,
              "headshot_percentage": 37.3
            },
            {
              "account_id": 14737,
              "name": "meyern",
              "nick": "meyern",
              "score": 10,
              "deaths": 15,
              "assists": 0,
              "damage_per_round": 63.291666666666664,
              "primary_weapon": "m4a1",
              "has_kevlar": true,
              "has_helmet": false,
              "has_defuse_kit": false,
              "maps_played": 17,
              "total_kills": 278,
              "total_deaths": 308,
              "headshot_percentage": 53.2
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
          "label": "MIBR",
          "probability": 0.5,
          "odds": 1.87,
          "is_locked": false,
          "lock_reason": null
        },
        {
          "outcome": 1,
          "label": "Evil Geniuses",
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

## [Dota] Scoreboards

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
            1. `hero_id`: Hero id. Should be used for assets resources collection, see [section](#dota-assets-api) below
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


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

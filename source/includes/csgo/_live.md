## Live games API

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
| `Ended`             | The match end result have been observed. 
| `WaitingForReplayParse` | To address ambuguity and overcome fundamental data source we process replays. This will resolve all markets that have not been resolved during match being live. The match will transition to this state when replay url will be determined and will stay in it until file is processed.
| `ReplayNotAvailable` | There are rare cases when match replay was not recorded and is not available. Is such cases unresolved markets will be marked as `NotHappened`. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ResultNotAvailable` | Tha match should be considered invalid. This is an observable side effect from underlying data source. Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.
| `ReplayParsed`       | Terminal state. The match will stay in cache for some time and then won't be available as live match anymore.

### Markets

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

### Market status

Market status can have following values:

| **Value**           | **Description** |
| ---                 | ---             |
| `Open`              | The market is open and is recommended to be traded
| `OnHold`            | The market is put on hold due to market template configuration and is recommended not to be traded
| `WaitingForResult`  | Some data sources can not provide enough information to resolve market in real-time (due to absence of data or not enough resolution). The result will be available after replay parse
| `Resolved`          | Market is resolved successfully
| `NotHappened`       | None of the market outcomes occurred and market is recommended to be refunded

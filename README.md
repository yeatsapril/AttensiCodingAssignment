# README

Coding Assignemnt: Api Leaderboard using RoR

## Endpoints

### Player:
http://localhost:3000/v1/players

POST params:
- name (string)

### Playthrough:

http://localhost:3000/v1/playthroughs

POST params:
- started_playing (datetime)
- finished_playing (datetime)
- score (integer)
- player_id (integer)

### Impact Report:

http://localhost:3000/v1/impact_reports/

### Weekly Summary:

Top by score: http://localhost:3000/v1/weekly_summaries/score
Top by time played: http://localhost:3000/v1/weekly_summaries/time_played

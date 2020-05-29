--Modify it to show the matchid and player name for all goals scored by Germany. 
--To identify German players, check for: teamid = 'GER'
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER'

--Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

--Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (game.id=goal.matchid)
where teamid = 'GER'

--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (game.id=goal.matchid)
where player LIKE 'Mario%'


--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid,coach, gtime
FROM goal 
JOIN eteam on goal.teamid=eteam.id
WHERE gtime<=10

--List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM game 
JOIN eteam on game.team1 = eteam.id
WHERE LOWER(coach) = 'fernando santos'

--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT DISTINCT player
FROM goal JOIN game ON goal.matchid = game.id 
WHERE (game.team1='GER' OR game.team2='GER') AND goal.teamid != 'GER' AND game.id = goal.matchid

--Show teamname and the total number of goals scored.
SELECT teamname,  COUNT(goal.matchid)
FROM eteam JOIN goal ON eteam.id = goal.teamid
GROUP BY teamname

--Show the stadium and the number of goals scored in each stadium.
SELECT stadium,  COUNT(goal.matchid)
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY stadium

--For every match involving 'POL', show the matchid, date and the number of goals scored.


















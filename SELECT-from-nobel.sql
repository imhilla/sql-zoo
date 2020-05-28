--Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--Show who won the 1962 prize for Literature.
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';
--List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

 --When was Citizen Kane released?
 SELECT yr 'Year'
 FROM movie
 WHERE title = 'Citizen Kane' 

 --List all of the Star Trek movies, include the id, title 
 --and yr (all of these movies include the words Star Trek in the title). Order results by year.
 SELECT id, title, yr 'Year'
FROM movie
WHERE title LIKE '%Star Trek%' 
ORDER By yr

--What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE LOWER(name) =  'Glenn Close'

--What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE LOWER(title) =  'Casablanca'

--Obtain the cast list for 'Casablanca'.
SELECT name
FROM casting
JOIN actor on actor.id = casting.actorid
WHERE movieid = 11768

--Obtain the cast list for the film 'Alien'
SELECT name
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor on actor.id = casting.actorid
WHERE LOWER(movie.title) = 'alien'
















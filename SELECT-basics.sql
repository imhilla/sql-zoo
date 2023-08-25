-- The example uses a WHERE clause to show the population of 'Germany'. 
-- Note that strings (pieces of text that are data) should be in 'single quotes'

SELECT population FROM world
  WHERE name = 'Germany'

--Checking a list The word IN allows us to check if an item is in a list. 
-- The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--  BETWEEN allows range checking (range specified is inclusive of boundary values)

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
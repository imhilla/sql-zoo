--This tutorial looks at how we can use SELECT statements 
--within SELECT statements to perform more complex queries.

--List each country name where the population is larger than that of 'Russia'
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Romania')

--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world 
WHERE continent = 'europe' AND 
gdp/population >
(SELECT gdp/population FROM world 
WHERE name='united kingdom')

--List the name and continent of countries in the 
--continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent 
FROM world
WHERE continent IN(SELECT continent from world WHERE name IN ('Argentina', 'Australia'))
Order by name

--Which country has a population that is more than Canada but less than Poland? 
--Show the name and the population.
SELECT name, population FROM world
WHERE population>(SELECT population FROM world WHERE name = 'Canada' ) 
AND population <(SELECT population FROM world WHERE name = 'Poland')

--Show the name and the population of each country in Europe. 
--Show the population as a percentage of the population of Germany.
SELECT name, CONCAT(ROUND(100*population/ (SELECT population 
                                              FROM world 
                                                WHERE name = 'Germany'), 0),'%')
FROM world
WHERE continent = 'Europe'
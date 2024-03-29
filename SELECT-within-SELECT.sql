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

--Which countries have a GDP greater than every country in Europe?
-- [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
  FROM world
 WHERE gdp IS NOT NULL AND gdp > ALL(SELECT gdp
                           FROM world
                          WHERE continent = 'Europe' AND gdp IS NOT NULL)

--Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
        AND population>0)

--List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
WHERE LOWER(name) <= ALL (SELECT LOWER(name) FROM world y
					WHERE x.continent = y.continent
					)

--Find the continents where all countries have a population <= 25000000. 
--Then find the names of the countries associated with these continents. Show name, continent and population.


--Some countries have populations more than three
-- times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT  name, continent FROM world x
WHERE population > ALL (SELECT 3 * population FROM world y
					WHERE y.continent = x.continent AND x.name != y.name)
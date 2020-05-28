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

--How many stops are in the database.
SELECT COUNT(id) 'Stops'
FROM stops

--Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE LOWER(name) = 'craiglockhart'

--Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name
FROM stops
JOIN route ON route.stop = stops.id 
WHERE route.num = '4' AND route.company = 'LRT';

--The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). 
--Run the query and notice the two services that link these stops have a count of 2. 
--Add a HAVING clause to restrict the output to these two route.
SELECT company, num, COUNT(*) 'stops' 
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING stops > 1

/*Execute the self join shown and observe that b.stop gives all the places you
 can get to from Craiglockhart, without changing routes. Change the query so that
  it shows the services from Craiglockhart to London Road.*/

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

/*The query shown is similar to the previous one, however by joining two copies of 
the stops table we can refer to stops by name rather than by number. 
Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. 
If you are tired of these places try 'Fairmilehead' against 'Tollcross'*/

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE LOWER(stopa.name)='Craiglockhart' AND LOWER(stopb.name) = 'london road'

--Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137 OR b.stop=115 AND b.stop = 137

--
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops aas on aas.id = a.stop
JOIN stops bs on bs.id = b.stop
WHERE (aas.name = 'Craiglockhart' AND bs.name = 'Tollcross') or
(bs.name = 'Craiglockhart' AND aas.name = 'Tollcross')





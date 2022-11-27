--Problem 1

SELECT Movie.name AS Title, Movie.year AS Year
FROM Movie
JOIN Actor ON Movie.id = Actor.movie_id
JOIN Person ON Actor.actor_id = Person.id
WHERE Person.name = 'Geena Davis';

--Problem 2

SELECT 
MIN(runtime) AS 'Min Runtime', 
MAX(runtime) AS 'Max Runtime', 
ROUND(AVG(runtime), 2) AS 'Avg Runtime' --Wrapped the AVG function in a ROUND function to make it more readable
FROM Movie 
WHERE rating = 'R';

--Problem 3

SELECT Oscar.type AS 'Oscar Type', Oscar.year AS 'Year Won', Movie.name AS 'Movie Name' 
FROM Oscar 
JOIN Movie ON Oscar.movie_id = Movie.id 
WHERE Oscar.person_id = '0000229';

--Problem 4

SELECT pob AS 'Place of Birth', COUNT(pob) AS Total 
FROM Person 
WHERE pob IS NOT NULL 
GROUP BY pob HAVING Total >= 50
ORDER BY Total ASC;

--Problem 5

SELECT COUNT(Movie.id) AS 'Movies Without Oscars'
FROM Movie 
WHERE Movie.id 
NOT IN (SELECT Oscar.movie_id FROM Oscar);

--Problem 6

SELECT Person.name, COUNT(Actor.actor_id) AS Count 
FROM Person 
LEFT OUTER JOIN Actor ON Person.id = Actor.actor_id
WHERE Person.pob LIKE '%Sweden%' 
GROUP BY Person.name
ORDER BY Count DESC, Person.name ASC;

--Problem 7

SELECT COUNT(DISTINCT Director.director_id) AS Directors 
FROM Director 
LEFT OUTER JOIN Movie ON Director.movie_id = Movie.id 
WHERE Movie.rating = 'R';

--Problem 8

UPDATE Movie 
SET rating = 'PG-13' 
WHERE name LIKE 'Indiana Jones%' AND rating != 'PG-13';
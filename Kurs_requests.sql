USE kinopoisk2;

-- Запрос на режиссера конкретного фильма и принадлежность к жанру
SELECT 
	f.filmname as filmname, 
	f.created_at as 'year',
	f.country as country,
	p.name as director,
	g.name as genre
FROM films f
JOIN filmography fg
JOIN persons p
JOIN film_genres fgen
JOIN genres g
WHERE f.filmname = 'Малхолланд Драйв' AND fg.film_id = f.id AND p.id = fg.person_id AND fgen.film_id = f.id AND fgen.genre_id = g.id
ORDER BY g.name;


-- Запрос на личность и принадлежность к жанру
SELECT DISTINCT
	p.name as name,
	g.name as genre
FROM persons p
JOIN films f
JOIN filmography fg
JOIN film_genres fgen
JOIN genres g
WHERE fg.film_id = f.id AND p.id = fg.person_id AND fgen.film_id = f.id AND fgen.genre_id = g.id
ORDER BY p.name;


-- Запрос на личность и принадлежность к жанру
SELECT
	filmname as 'Film name',
	created_at as 'Year'
FROM films
ORDER BY created_at DESC;


-- Запрос на рейтинг фильма по оценкам пользователей
SELECT
	filmname as 'Film name',
	AVG(film_score) as 'Score'
FROM films f
JOIN ratings r
WHERE f.id = r.film_id 
GROUP BY f.filmname
ORDER BY r.film_score DESC;


-- Вьюшка со всеми режиссерами
CREATE OR REPLACE VIEW directors
AS SELECT 
	p.name as 'Person name', 
	f.filmname as 'Film',
	f.created_at as 'Year'
FROM persons p
JOIN filmography fg
JOIN films f
WHERE f.id = fg.film_id AND p.id = fg.person_id AND fg.director = 1
ORDER BY p.name;


-- Вьюшка со всеми актерами
CREATE OR REPLACE VIEW actors
AS SELECT 
	p.name as 'Person name', 
	f.filmname as 'Film',
	f.created_at as 'Year',
	f.country as 'Country'
FROM persons p
JOIN filmography fg
JOIN films f
WHERE f.id = fg.film_id AND p.id = fg.person_id AND fg.actor = 1
ORDER BY fg.actor;


-- Вьюшка со всеми фильмами по жанрам
CREATE OR REPLACE VIEW by_genres
AS SELECT 
	g.name as 'Genres', 
	f.filmname as 'Film',
	f.created_at as 'Year',
	f.country as 'Country'
FROM genres g
JOIN film_genres fg
JOIN films f
WHERE f.id = fg.film_id AND g.id = fg.genre_id 
-- AND fg.genre_id = 3
ORDER BY fg.genre_id;


-- Актеры, снявшиеся в наибольшем количестве фильмов, по убыванию
SELECT p.name,
	COUNT(*) as films
FROM filmography fg
JOIN persons p
WHERE fg.actor = 1 AND p.id = fg.person_id
GROUP BY name
ORDER BY films DESC;


-- Фильмы из США
SELECT 
	filmname,
	country
FROM films
WHERE country RLIKE 'США';


-- У нас еще один представитель Болливуда
DROP TABLE IF EXISTS bollywood;
CREATE TABLE bollywood (
	created_at DATETIME NOT NULL,
	film_id BIGINT(20) NOT NULL,
	film_name VARCHAR(45) NOT NULL
) 
ENGINE = ARCHIVE;


-- Триггер
DROP TRIGGER IF EXISTS india_films;
delimiter //
CREATE TRIGGER india_films AFTER INSERT ON films
FOR EACH ROW
BEGIN
	INSERT INTO bollywood (created_at, film_id, film_name)
	VALUES (NOW(), NEW.id, NEW.filmname);
END //
delimiter ;


INSERT INTO `films` 
VALUES 
	(26,'Танцор диско',1982,'Индия',NULL,16);


-- Сеансы на сегодня
SELECT 
	ks.session_time,
	ks.session_period,
	t.theatre_name,
	f.filmname
FROM kino_sessions ks
JOIN theatres t
JOIN films f
WHERE ks.session_time RLIKE CURDATE() AND ks.theatre_id = t.id AND ks.film_id = f.id
GROUP BY ks.session_time 
ORDER BY ks.session_time;


-- Функция по проверке сеансов на сегодняшний день
DROP FUNCTION IF EXISTS check_sessions;
DELIMITER //

CREATE FUNCTION check_sessions()
RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE result INT;
	SET result = (
		SELECT COUNT(*) as sessions
		FROM kino_sessions ks
		WHERE ks.session_time RLIKE CURDATE());
 	IF result > 0 THEN 
 		RETURN 'Сегодня есть сеансы';
 	ELSE 
 		RETURN 'На сегодня нет сеансов';
 	END IF;
END//
delimiter ;


SELECT check_sessions();




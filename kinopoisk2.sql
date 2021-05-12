/*
Здесь представлена база, вдохновленная функционалом крупнейшего русскоязычного интернет-сервиса о кино Кинопоиск. 
В базе имеются таблицы с фильмами, киноличностями, кинотеатрами и расписанием кинопоказов на ближайшее время.
Сформированы рейтинги пользователей и рецензии.
Также сформированы несколько представлений и запросов. Добавлена функция по проверке сеансов на сегодняшнюю (текущую) дату.
*/

DROP DATABASE IF EXISTS kinopoisk2;
CREATE DATABASE kinopoisk2;
USE kinopoisk2;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE, 
	
    INDEX users_firstname_lastname_idx(firstname, lastname)
) COMMENT 'юзеры';


/*
жанры (1 Боевик, 2 Триллер, 3 Драма, 4 Короткометражка, 5 Фантастика, 6 Мелодрама, 7 Комедия, 8 Документальный, 9 Мультфильм, 
10 Семейный, 11 Криминал, 12 Фэнтези, 13 Биография, 14 История, 15 Спорт, 16 Детектив, 17 Прикючения, 18 Музыка, 19 Военный, 20 Мюзикл)
 */
DROP TABLE IF EXISTS genres; 
CREATE TABLE genres(
	id SERIAL,
    name VARCHAR(255)
);


DROP TABLE IF EXISTS films;
CREATE TABLE films(
	id SERIAL,
	filmname VARCHAR(255),
	created_at YEAR NOT NULL,
	country VARCHAR(255),
	budget BIGINT UNSIGNED,
	-- person_id BIGINT UNSIGNED NOT NULL,
	genre_id BIGINT UNSIGNED,
	
	director BIGINT UNSIGNED,
    writer BIGINT UNSIGNED,
    producer BIGINT UNSIGNED,
    actor BIGINT UNSIGNED,
    operator BIGINT UNSIGNED,
    editor BIGINT UNSIGNED,
    composer BIGINT UNSIGNED,
    artist BIGINT UNSIGNED, 
    
    INDEX filmname(filmname)
);


DROP TABLE IF EXISTS persons; -- Режиссеры, Сценаристы, Продюсеры, Актеры, Операторы, Монтажеры, Композиторы, Художники
CREATE TABLE persons(
	id SERIAL,
    name VARCHAR(255),
    birthday_at DATE NOT NULL,
  	director BIT,
    writer BIT,
    producer BIT,
    actor BIT,
    operator BIT,
    editor BIT,
    composer BIT,
    artist BIT
);


DROP TABLE IF EXISTS filmography;
CREATE TABLE filmography(
	film_id BIGINT UNSIGNED,
	person_id BIGINT UNSIGNED,
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);
     

DROP TABLE IF EXISTS film_genres;
CREATE TABLE film_genres(
	film_id BIGINT UNSIGNED,
	genre_id BIGINT UNSIGNED,
	
	FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
        

DROP TABLE IF EXISTS trailers;
CREATE TABLE trailers(
	id SERIAL,
	film_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (film_id) REFERENCES films(id)
);


DROP TABLE IF EXISTS favorites; -- избранное
CREATE TABLE favorites(
	user_id BIGINT UNSIGNED NOT NULL,
	film_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, film_id), -- чтобы не было 2 одинаковых фильмов в избранном
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);


DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
	user_id BIGINT UNSIGNED NOT NULL,
	film_id BIGINT UNSIGNED NOT NULL,
    film_score TINYINT,
    score_date DATETIME DEFAULT NOW(),
	
    PRIMARY KEY (user_id, film_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);


DROP TABLE IF EXISTS `theatres`;
CREATE TABLE `theatres` (
	id SERIAL,
	theatre_name VARCHAR(50),
	address VARCHAR(120),
	phone BIGINT UNSIGNED UNIQUE
);


DROP TABLE IF EXISTS `kino_sessions`;
CREATE TABLE `kino_sessions` (
	session_id SERIAL,
	theatre_id BIGINT UNSIGNED NOT NULL,
	session_time DATETIME NOT NULL,
	session_period TIME NOT NULL,
	film_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (film_id) REFERENCES films(id),
	FOREIGN KEY (theatre_id) REFERENCES theatres(id)
);


DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
	review_id SERIAL,
	film_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    rewiev_date DATETIME DEFAULT NOW(),
	
    PRIMARY KEY (review_id, film_id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

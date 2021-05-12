DROP DATABASE IF EXISTS kinopoisk2;
CREATE DATABASE kinopoisk2;
USE kinopoisk2;


DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `careers` 
VALUES 
	('1','Режиссер'),
	('2','Сценарист'),
	('3','Продюсеры'),
	('4','Актер'),
	('5','Оператор'),
	('6','Монтажер'),
	('7','Композитор'),
	('8','Художник'); 


DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday_at` date NOT NULL,
  `director` bit(1) DEFAULT NULL,
  `writer` bit(1) DEFAULT NULL,
  `producer` bit(1) DEFAULT NULL,
  `actor` bit(1) DEFAULT NULL,
  `operator` bit(1) DEFAULT NULL,
  `editor` bit(1) DEFAULT NULL,
  `composer` bit(1) DEFAULT NULL,
  `artist` bit(1) DEFAULT NULL,
  `genre_id` set('1','2','3','4','5','6','7','8','9','10','11') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `persons` 
VALUES 
	(1,'Дэвид Линч','1946-01-20',1,1,1,1,1,1,1,1,'1'),
	(2,'Нил Бломкамп','1979-09-17',1,1,1,1,NULL,1,NULL,NULL,'2'),
	(3,'Дени Вильнёв','1967-09-03',1,1,1,1,1,1,NULL,NULL,'3'),
	(4,'Том Хэнкс','1956-07-09',1,1,1,NULL,1,NULL,NULL,NULL,'4'),
	(5,'Рассел Кроу','1964-04-07',1,NULL,1,1,NULL,NULL,NULL,NULL,'5'),
	(6,'Рене Зеллвегер','1969-04-25',NULL,1,1,1,NULL,NULL,NULL,NULL,'6'),
	(7,'Леонардо ДиКаприо','1974-11-11',NULL,1,1,1,NULL,NULL,NULL,NULL,'7'),
	(8,'Эдвард Нортон','1969-08-18',1,1,1,1,1,1,NULL,NULL,'8'),
	(9,'Уиллем Дефо','1955-07-22',NULL,1,1,1,NULL,NULL,NULL,NULL,'9'),
	(10,'Рэйф Файнс','1962-12-22',1,NULL,1,1,NULL,NULL,NULL,NULL,'10'),
	(11,'Кейт Уинслет','1975-10-05',NULL,NULL,1,1,NULL,NULL,NULL,NULL,'11'),
	(12,'Сирша Ронан','1994-04-12',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'1'),
	(13,'Кира Найтли','1985-03-26',NULL,NULL,1,1,NULL,NULL,NULL,NULL,'2'),
	(14,'Джеймс МакЭвой','1979-04-21',NULL,NULL,1,1,NULL,NULL,NULL,NULL,'3'),
	(15,'Эдриан Броуди','1973-04-14',NULL,1,1,1,NULL,NULL,1,NULL,'4'),
	(16,'Эми Адамс','1974-08-20',NULL,NULL,1,1,NULL,NULL,NULL,NULL,'5'),
	(17,'Рэйчел Вайс','1970-03-07',1,1,1,1,NULL,NULL,NULL,NULL,'6'),
	(18,'Киану Ривз','1964-09-02',1,NULL,1,1,NULL,NULL,NULL,NULL,'7'),
	(19,'Шарлиз Терон','1975-08-07',NULL,NULL,1,1,NULL,NULL,NULL,1,'8'),
	(20,'Аль Пачино','1940-04-25',1,1,1,1,NULL,NULL,NULL,NULL,'2'),
	(21,'Кайл МакЛоклен','1959-02-22',1,NULL,NULL,1,NULL,NULL,NULL,NULL,'3'),
	(22,'Лора Дерн','1967-02-10',1,1,1,1,NULL,NULL,NULL,NULL,'3'),
	(23,'Хоакин Феникс','1974-10-28',1,1,1,1,NULL,NULL,NULL,NULL,'3'),
	(24,'Кристиан Бэйл','1974-01-30',NULL,NULL,1,1,NULL,NULL,NULL,NULL,'3'),
	(25,'Марк Уолберг','1971-06-05',NULL,NULL,1,1,NULL,NULL,1,NULL,'3'),
	(26,'Ханс Циммер','1957-09-12',NULL,NULL,1,1,NULL,NULL,1,NULL,'3');


DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `genres` 
VALUES 
	('1','Боевик'),
	('2','Триллер'),
	('3','Драма'),
	('4','Короткометражка'),
	('5','Фантастика'),
	('6','Мелодрама'),
	('7','Комедия'),
	('8','Документальный'),
	('9','Мультфильм'),
	('10','Семейный'),
	('11','Криминал'),
	('12','Фэнтези'),
	('13','Биография'),
	('14','История'),
	('15','Спорт'),
	('16','Детектив'),
	('17','Прикючения'),
	('18','Музыка'),
	('19','Военный'),
	('20','Мюзикл'); 


DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filmname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` year(4) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` bigint(20) unsigned DEFAULT NULL,
  `genre_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `genre_id` (`genre_id`),
  KEY `filmname` (`filmname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `films` 
VALUES 
	-- (1,'Малхолланд Драйв',1999,'США',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,'Малхолланд Драйв',1999,'США',NULL,2),
	(2,'Головоломка',2015,'США',175000000,9),
	(3,'Проклятый путь',2002,'США',110000000,2),
	(4,'Нокдаун',2005,'США',88000000,3),
	(5,'Сиротский Бруклин',2019,'США',26000000,3),
	(6,'Отель «Гранд Будапешт»',2014,'Германия, США',23000000,7),
	(7,'Чтец',2008,'Германия, США',32000000,3),
	(8,'Прибытие',2016,'США, Канада, Индия',47000000,5),
	(9,'Боец',2010,'США',25000000,3),
	(10,'Она',2013,'США',23000000,6),
	(11,'Милые кости',2009,'США, Великобритания, Новая Зеландия',65000000,12),
	(12,'Искупление',2007,'Великобритания, Франция, США',20000000,3),
	(13,'Матрица',1999,'США',63000000,5),
	(14,'Адвокат дьявола',1997,'США, Германия',57000000,2),
	(15,'Пианист',2002,'Польша, Франция, Великобритания, Германия',35000000,3),
	(16,'Поймай меня, если сможешь',2002,'США, Канада',52000000,11),
	(17,'Душа',2020,'США, Германия',NULL,9),
	(18,'Чудо-женщина: 1984',2020,'США, Великобритания, Испания',200000000,12),
	(19,'Огонь',2020,'Россия',8500000,3),
	(20,'Семейка Крудс: Новоселье',2020,'США',65000000,9),
	(21,'Район №9',2009,'ЮАР, США, Новая Зеландия, Канада',30000000,5),
	(22,'Твин Пикс (сериал 1990 – 1991)',1990,'США',NULL,2),
	(23,'Синий бархат',1986,'США',6000000,2),
	(24,'Гладиатор',2000,'США, Великобритания, Мальта, Марокко',103000000,1),
	(25,'Внутренняя империя',2006,'США',NULL,2);


DROP TABLE IF EXISTS `filmography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmography` (
  `film_id` bigint(20) unsigned DEFAULT NULL,
  `person_id` bigint(20) unsigned DEFAULT NULL,
  `director` BIT DEFAULT 0,
  `writer` BIT DEFAULT 0,
  `producer` BIT DEFAULT 0,
  `actor` BIT DEFAULT 0,
  `operator` BIT DEFAULT 0,
  `editor` BIT DEFAULT 0,
  `composer` BIT DEFAULT 0,
  `artist` BIT DEFAULT 0,
  CONSTRAINT `filmography_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `filmography_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `filmography` 
VALUES 
	(1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,21,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(3,4,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(4,5,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(4,6,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(5,8,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(6,8,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(6,9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(6,10,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(6,12,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(7,10,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(7,11,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(8,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,16,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(9,16,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(9,24,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(9,25,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(10,16,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(10,23,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(11,11,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(11,12,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(11,17,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(11,25,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(12,12,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(12,13,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(12,14,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(13,18,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(14,18,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(14,19,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(14,20,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(15,15,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(16,4,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(16,7,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(18,26,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),
	(21,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(22,1,1,1,1,1,NULL,NULL,NULL,NULL),
	(22,21,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(22,22,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(23,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(23,21,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(24,5,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(24,23,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(24,26,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),
	(25,22,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),
	(25,1,1,1,1,1,1,1,1,NULL);


DROP TABLE IF EXISTS film_genres;
CREATE TABLE film_genres(
	film_id BIGINT UNSIGNED,
	genre_id BIGINT UNSIGNED,
	
	FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

/*
жанры (1 Боевик, 2 Триллер, 3 Драма, 4 Короткометражка, 5 Фантастика, 6 Мелодрама, 7 Комедия, 8 Документальный, 9 Мультфильм, 
10 Семейный, 11 Криминал, 12 Фэнтези, 13 Биография, 14 История, 15 Спорт, 16 Детектив, 17 Прикючения, 18 Музыка, 19 Военный, 20 Мюзикл)
 */
INSERT INTO `film_genres` 
VALUES 
	(1,2),(1,3),(1,16),
	(2,9),(2,10),(2,7),
	(3,2),(3,3),(3,11),
	(4,3),(4,6),(4,13),(4,14),(4,15),
	(5,3),(5,11),(5,16),
	(6,7),(6,17),(6,16),(6,11),
	(7,3),(7,6),
	(8,5),(8,2),(8,3),(8,16),
	(9,3),(9,13),(9,15),
	(10,6),(10,5),(10,3),
	(11,12),(11,2),(11,3),(11,11),(11,16),
	(12,3),(12,6),(12,16),(12,19),
	(13,5),(13,1),
	(14,2),(14,12),(14,3),(14,16),
	(15,3),(15,19),(15,13),(15,18),
	(16,11),(16,13),(16,7),
	(17,9),(17,12),(17,7),(17,17),(17,10),(17,18),
	(18,12),(18,1),(18,17),(18,5),
	(19,3),(19,17),
	(20,9),(20,12),(20,7),(20,17),(20,10),
	(21,2),(21,3),(21,16),
	(22,2),(22,3),(22,11),(22,16),(22,5),
	(23,2),(23,3),(23,16),
	(24,1),(24,14),(24,3),(24,17),
	(25,12),(25,2),(25,3),(25,16);
	

DROP TABLE IF EXISTS `theatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theatres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `theatre_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `theatres` 
VALUES 
	(1,'Пять звёзд на Новокузнецкой','Большой Овчинниковский пер., 16, галерея «Аркадия», 3 этаж',89951491027),
	(2,'Синема Парк Метрополис на Войковской','Ленинградское ш., 16а, стр. 4, ТЦ «Метрополис», 3 этаж',89583766532),
	(3,'Формула Кино на Кутузовском','Кутузовский просп., 57, ТРЦ «Океания», 4 этаж',89444077738),
	(4,'Каро 11 Октябрь','ул. Новый Арбат, 24',89434988175),
	(5,'Каро Sky 17 Авиапарк','Ходынский бульв., 4, ТЦ «Авиапарк», 4-й этаж',89216178962);


DROP TABLE IF EXISTS `kino_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kino_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `theatre_id` bigint(20) unsigned NOT NULL,
  `session_time` datetime NOT NULL,
  `session_period` time NOT NULL,
  `film_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `session_id` (`session_id`),
  KEY `film_id` (`film_id`),
  KEY `theatre_id` (`theatre_id`),
  CONSTRAINT `kino_sessions_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  CONSTRAINT `kino_sessions_ibfk_2` FOREIGN KEY (`theatre_id`) REFERENCES `theatres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `kino_sessions` 
VALUES 
	(1,1,'2021-01-22 13:25:00','02:31:00',18),
	(2,1,'2021-01-22 14:45:00','02:31:00',18),
	(3,1,'2021-01-22 16:10:00','02:31:00',18),
	(4,1,'2021-01-22 14:00:00','02:11:00',19),
	(5,1,'2021-01-22 15:40:00','02:11:00',19),
	(6,1,'2021-01-22 13:40:00','01:35:00',20),
	(7,1,'2021-01-22 14:50:00','01:35:00',20),
	(8,1,'2021-01-22 16:50:00','01:40:00',17),
	(9,2,'2021-01-22 13:30:00','02:31:00',18),
	(10,2,'2021-01-22 17:00:00','02:11:00',19),
	(11,2,'2021-01-22 14:00:00','01:35:00',20),
	(12,3,'2021-01-22 17:10:00','02:31:00',18),
	(13,3,'2021-01-22 17:40:00','02:11:00',19),
	(14,4,'2021-01-22 16:05:00','02:31:00',18),
	(15,4,'2021-01-22 18:10:00','02:11:00',19),
	(16,5,'2021-01-22 13:00:00','01:40:00',17),
	(17,5,'2021-01-22 15:30:00','01:40:00',17),
	(18,5,'2021-01-22 13:30:00','02:31:00',18),
	(19,5,'2021-01-22 17:40:00','02:11:00',19),
	(20,5,'2021-01-22 14:00:00','01:35:00',20),

	(21,1,'2021-01-23 13:25:00','02:31:00',18),
	(22,1,'2021-01-23 14:45:00','02:31:00',18),
	(23,1,'2021-01-23 16:10:00','02:31:00',18),
	(24,1,'2021-01-23 14:00:00','02:11:00',19),
	(25,1,'2021-01-23 15:40:00','02:11:00',19),
	(26,1,'2021-01-23 13:40:00','01:35:00',20),
	(27,1,'2021-01-23 14:50:00','01:35:00',20),
	(28,1,'2021-01-23 16:50:00','01:40:00',17),
	(29,2,'2021-01-23 13:30:00','02:31:00',18),
	(30,2,'2021-01-23 17:00:00','02:11:00',19),
	(31,2,'2021-01-23 14:00:00','01:35:00',20),
	(32,3,'2021-01-23 17:10:00','02:31:00',18),
	(33,3,'2021-01-23 17:40:00','02:11:00',19),
	(34,4,'2021-01-23 16:05:00','02:31:00',18),
	(35,4,'2021-01-23 18:10:00','02:11:00',19),
	(36,5,'2021-01-23 13:00:00','01:40:00',17),
	(37,5,'2021-01-23 15:30:00','01:40:00',17),
	(38,5,'2021-01-23 13:30:00','02:31:00',18),
	(39,5,'2021-01-23 17:40:00','02:11:00',19),
	(40,5,'2021-01-23 14:00:00','01:35:00',20),
	
	(41,1,'2021-01-24 13:25:00','02:31:00',18),
	(42,1,'2021-01-24 14:45:00','02:31:00',18),
	(43,1,'2021-01-24 16:10:00','02:31:00',18),
	(44,1,'2021-01-24 14:00:00','02:11:00',19),
	(45,1,'2021-01-24 15:40:00','02:11:00',19),
	(46,1,'2021-01-24 13:40:00','01:35:00',20),
	(47,1,'2021-01-24 14:50:00','01:35:00',20),
	(48,1,'2021-01-24 16:50:00','01:40:00',17),
	(49,2,'2021-01-24 13:30:00','02:31:00',18),
	(50,2,'2021-01-24 17:00:00','02:11:00',19),
	(51,2,'2021-01-24 14:00:00','01:35:00',20),
	(52,3,'2021-01-24 17:10:00','02:31:00',18),
	(53,3,'2021-01-24 17:40:00','02:11:00',19),
	(54,4,'2021-01-24 16:05:00','02:31:00',18),
	(55,4,'2021-01-24 18:10:00','02:11:00',19),
	(56,5,'2021-01-24 13:00:00','01:40:00',17),
	(57,5,'2021-01-24 15:30:00','01:40:00',17),
	(58,5,'2021-01-24 13:30:00','02:31:00',18),
	(59,5,'2021-01-24 17:40:00','02:11:00',19),
	(60,5,'2021-01-24 14:00:00','01:35:00',20);


DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';


INSERT INTO `users` 
VALUES 
	(1,'Miguel','Kuhic','qlittel@example.net','7f80ca6096e843d99db9bd7c95ae1efc99011980',89598395739),
	(2,'Donnie','Lesch','uebert@example.com','a7db292a7807ca9ae6bbc31b91c3220488fc6ace',89245774675),
	(3,'Cydney','Schaefer','stacey16@example.net','297eb817e94bec553c37671f07bcb71a97f6eb0a',89784493693),
	(4,'Kameron','Schaefer','bianka66@example.com','8ddd5fdce2c5034cf650df2c06e99efcc4c005bf',89139888499),
	(5,'Trisha','Satterfield','lang.deontae@example.net','ef0dd86a7295a6e17d59ffe6b8c012581908aa93',89051523325),
	(6,'Mozell','Littel','fritsch.janiya@example.net','67d43224919d784a5054c046a6c809db371a4f3d',89717158929),
	(7,'Leone','Beier','gparker@example.com','893a3cc958b50e11a06836fc26e084f403c4aed5',89391607193),
	(8,'Merl','Pfannerstill','eugene.davis@example.org','b7439149db6aad2bc3d4cf307c01ae205a3838be',89742043690),
	(9,'Deondre','Durgan','israel.treutel@example.org','ab5142816bc3e4f9c421b7e6acd17e931a927c52',89533852716),
	(10,'Darron','Kassulke','ahudson@example.org','8156284d3917b6a267ec0a1ba6cb1005192def23',89118351324);


DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `user_id` bigint(20) unsigned NOT NULL,
  `film_id` bigint(20) unsigned NOT NULL,
  `film_score` tinyint(4) DEFAULT NULL,
  `score_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`film_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `ratings` 
VALUES 
	(1,1,7,'2014-02-25 10:56:15'),
	(1,2,8,'2014-01-08 20:59:00'),
	(1,3,8,'2014-08-29 04:12:32'),
	(1,4,8,'2014-11-22 15:54:27'),
	(3,3,7,'2014-06-01 01:04:44'),
	(3,5,8,'2014-04-06 04:41:38'),
	(3,16,8,'2014-12-14 20:45:29'),
	(3,13,8,'2014-07-05 12:21:36'),
	(5,5,7,'2014-12-22 11:08:06'),
	(5,15,8,'2014-11-23 09:08:38'),
	(6,4,6,'2014-07-17 11:50:32'),
	(6,6,7,'2014-05-11 01:45:30'),
	(7,7,8,'2014-11-28 20:43:29'),
	(7,17,7,'2014-10-17 19:44:32'),
	(8,8,9,'2014-02-13 12:45:50'),
	(8,18,7,'2014-09-13 10:45:22'),
	(9,9,8,'2014-03-07 08:25:28'),
	(9,19,8,'2014-08-23 18:05:01'),
	(10,10,8,'2014-12-23 10:09:42'),
	(10,20,8,'2021-01-14 14:01:30');


DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rewiev_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`review_id`,`film_id`),
  UNIQUE KEY `review_id` (`review_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `reviews` 
VALUES 
	(1,1,'Totam dolorem consequuntur officiis impedit molestias non architecto. Quo aut ad qui velit enim ipsam. Aliquam earum dolor libero hic ab rem ipsum. Commodi magni velit nisi ut est quis. At qui qui ea est minima.','2020-03-25 06:38:09'),
	(2,2,'Enim reiciendis aspernatur explicabo alias sit. Velit non molestiae nihil est dignissimos nisi quia.','2009-08-27 11:56:22'),
	(3,3,'Sed excepturi aut quasi eos qui est quod. Reiciendis temporibus recusandae accusantium voluptate voluptas repellendus. Architecto quia minus molestias voluptate.','1980-10-08 22:20:56'),
	(4,4,'Nulla non et placeat veniam ut. Vitae accusamus voluptas dignissimos sit labore sit autem. Magni placeat necessitatibus libero harum rerum ab minus error. Rerum aliquam ea animi ex voluptatem ducimus maxime.','1982-07-30 21:05:19'),
	(5,5,'Quos dicta molestiae sit id omnis impedit illo. Tempora alias eius quis odio magnam repellendus. Laudantium amet animi sequi et harum. Eum velit adipisci sunt quia.','1980-06-19 09:22:40'),
	(6,6,'Nulla dolor vitae et tempora consequatur in. Illum eum recusandae ea tenetur. Quia nostrum eligendi officiis ut. Tempora qui sed eius libero eveniet et perspiciatis rerum. Voluptas esse aut at sapiente.','1991-04-12 09:07:44'),
	(7,7,'Aut dolorem dolor et nihil vel sed. Sit officia ut est architecto libero et. Iusto animi sit laborum tempore esse eveniet. Ad aperiam earum vitae molestias illum ut. Fuga quisquam quo omnis deserunt in rerum laborum et.','2014-04-08 17:18:43'),
	(8,8,'Omnis tenetur aspernatur debitis. Earum voluptatem et qui nam sed tempore molestiae. Qui esse iure commodi consequatur provident.','1991-02-23 00:37:16'),
	(9,9,'Suscipit quo odio aut esse. Ab eum consequatur molestiae tempore. Fuga facere ad et magni sit. Voluptatem et quisquam facilis.','1999-01-12 10:06:23'),
	(10,10,'Tenetur eligendi necessitatibus vel ut fugit hic saepe. Et est amet dolor quod rerum possimus et. In aut id tempora exercitationem ullam. Dolores possimus optio ut mollitia veniam aperiam et quaerat.','2018-11-11 07:10:37');


DROP TABLE IF EXISTS `trailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trailers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `trailers_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `trailers` 
VALUES 
	(1,1),
	(21,1),
	(2,2),
	(22,2),
	(3,3),
	(23,3),
	(4,4),
	(24,4),
	(5,5),
	(25,5),
	(6,6),
	(26,6),
	(7,7),
	(27,7),
	(8,8),
	(28,8),
	(9,9),
	(29,9),
	(10,10),
	(30,10),
	(11,11),
	(31,11),
	(12,12),
	(32,12),
	(13,13),
	(33,13),
	(14,14),
	(34,14),
	(15,15),
	(35,15),
	(16,16),
	(36,16),
	(17,17),
	(37,17),
	(18,18),
	(38,18),
	(19,19),
	(39,19),
	(20,20),
	(40,20);


DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `user_id` bigint(20) unsigned NOT NULL,
  `film_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`film_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `favorites` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);


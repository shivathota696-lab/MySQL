create database gaming_programme;
use gaming_programme;

CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

INSERT INTO Genre (genre_id, genre_name) VALUES
(1,  'Action'), (2,  'Adventure'), (3,  'RPG'), (4,  'Strategy'), (5,  'Simulation'),
(6,  'Sports'), (7,  'Racing'), (8,  'Fighting'), (9,  'Puzzle'), (10, 'Platformer'),
(11, 'Horror'), (12, 'Sci‑Fi'), (13, 'Fantasy'), (14, 'Mystery'), (15, 'Thriller'),
(16, 'Comedy'), (17, 'Drama'), (18, 'Historical'), (19, 'Educational'), (20, 'Multiplayer');


CREATE TABLE Game (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(255),
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

INSERT INTO Game (game_id, game_name, genre_id) VALUES
(1,  'Game 1',  1), (2,  'Game 2',  2), (3,  'Game 3',  3), (4,  'Game 4',  4), (5,  'Game 5',  5),
(6,  'Game 6',  6), (7,  'Game 7',  7), (8,  'Game 8',  8), (9,  'Game 9',  9), (10, 'Game 10',10),
(11, 'Game 11',11), (12, 'Game 12',12), (13, 'Game 13',13), (14, 'Game 14',14), (15, 'Game 15',15),
(16, 'Game 16',16), (17, 'Game 17',17), (18, 'Game 18',18), (19, 'Game 19',19), (20, 'Game 20',20);


CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255)
);

INSERT INTO Publisher (publisher_id, publisher_name) VALUES
(1,  'Publisher 1'), (2,  'Publisher 2'), (3,  'Publisher 3'), (4,  'Publisher 4'), (5,  'Publisher 5'),
(6,  'Publisher 6'), (7,  'Publisher 7'), (8,  'Publisher 8'), (9,  'Publisher 9'), (10, 'Publisher 10'),
(11, 'Publisher 11'), (12, 'Publisher 12'), (13, 'Publisher 13'), (14, 'Publisher 14'), (15, 'Publisher 15'),
(16, 'Publisher 16'), (17, 'Publisher 17'), (18, 'Publisher 18'), (19, 'Publisher 19'), (20, 'Publisher 20');


CREATE TABLE Game_publisher (
    game_publisher_id INT PRIMARY KEY,
    game_id INT,
    publisher_id INT,
    FOREIGN KEY (game_id) REFERENCES Game(game_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

INSERT INTO Game_publisher (game_publisher_id, game_id, publisher_id) VALUES
(1,  1,  1),  (2,  2,  2),  (3,  3,  3),  (4,  4,  4),  (5,  5,  5),
(6,  6,  6),  (7,  7,  7),  (8,  8,  8),  (9,  9,  9),  (10, 10, 10),
(11, 11, 11), (12, 12, 12), (13, 13, 13), (14, 14, 14), (15, 15, 15),
(16, 16, 16), (17, 17, 17), (18, 18, 18), (19, 19, 19), (20, 20, 20);


CREATE TABLE Platform (
    platform_id INT PRIMARY KEY,
    platform_name VARCHAR(255)
);

INSERT INTO Platform (platform_id, platform_name) VALUES
(1,  'PC'), (2,  'PlayStation'), (3,  'Xbox'), (4,  'Nintendo Switch'), (5,  'Mobile'),
(6,  'Stadia'), (7,  'Wii'), (8,  'Mac'), (9,  'Linux'), (10, 'Amazon Luna'),
(11, 'iOS'), (12, 'Android'), (13, 'VR'), (14, 'AR'), (15, 'Web'),
(16, 'PS Vita'), (17, '3DS'), (18, 'Dreamcast'), (19, 'GameCube'), (20, 'PSP');


CREATE TABLE Game_platform (
    game_platform_id INT PRIMARY KEY,
    game_publisher_id INT,
    platform_id INT,
    release_year INT,
    FOREIGN KEY (game_publisher_id) REFERENCES Game_publisher(game_publisher_id),
    FOREIGN KEY (platform_id) REFERENCES Platform(platform_id)
);

INSERT INTO Game_platform (game_platform_id, game_publisher_id, platform_id, release_year) VALUES
(1,  1,  1,  2020), (2,  2,  2,  2021), (3,  3,  3,  2022), (4,  4,  4,  2020), (5,  5,  5,  2021),
(6,  6,  6,  2022), (7,  7,  7,  2020), (8,  8,  8,  2021), (9,  9,  9,  2022), (10, 10, 10, 2020),
(11, 11, 11, 2021), (12, 12, 12, 2022), (13, 13, 13, 2020), (14, 14, 14, 2021), (15, 15, 15, 2022),
(16, 16, 16, 2020), (17, 17, 17, 2021), (18, 18, 18, 2022), (19, 19, 19, 2020), (20, 20, 20, 2021);


CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    region_names VARCHAR(255)
);

INSERT INTO Region (region_id, region_names) VALUES
(1,  'North America'), (2,  'South America'), (3,  'Europe'), (4,  'Asia'), (5,  'Africa'),
(6,  'Oceania'), (7,  'Middle East'), (8,  'Caribbean'), (9,  'Central America'), (10, 'Scandinavia'),
(11, 'Baltics'), (12, 'Balkans'), (13, 'South Asia'), (14, 'Southeast Asia'), (15, 'East Asia'),
(16, 'Pacific Islands'), (17, 'Antarctica'), (18, 'Greenland'), (19, 'Iceland'), (20, 'Mediterranean');


CREATE TABLE Region_sales (
    region_id INT,
    game_platform_id INT,
    number_sales INT,
    PRIMARY KEY (region_id, game_platform_id),
    FOREIGN KEY (game_platform_id) REFERENCES Game_platform(game_platform_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

INSERT INTO Region_sales (region_id, game_platform_id, number_sales) VALUES
(1,  1,  1200), (2,  2,  1350), (3,  3,  1100), (4,  4,  1500), (5,  5,  1250),
(6,  6,  1400), (7,  7,  1150), (8,  8,  1300), (9,  9,  1450), (10, 10, 1200),
(11, 11, 1550), (12, 12, 1600), (13, 13, 1700), (14, 14, 1650), (15, 15, 1750),
(16, 16, 1800), (17, 17, 1900), (18, 18, 2000), (19, 19, 2100),(20,20,2200);

select * from game;
select * from genre;
select * from game_publisher;
select * from publisher;
select * from game_platform;
select * from platform;
select * from region_sales;
select * from region;
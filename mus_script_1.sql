-- Задание 1

INSERT INTO artist(name)
VALUES ('Ария'), ('Би-2'), ('Слот'), ('Король и шут'), ('BUCK-TICK'), ('X Japan'), ('Daughtry'), ('Thousand Foot Krutch'), ('Пикник');

INSERT INTO genre(name)
VALUES ('alternative rock'), ('j-rock'), ('heavy-metal'), ('nu metal'), ('punk-rock'), ('rap-metal'), ('hard-rock'), ('post-grunge'), ('pop-rock');

INSERT INTO album(name, year)
VALUES
('Герой асфальта', 1987),
('Gessekai', 1998),
('Мяу кисс ми', 2001),
('Жаль, нет ружья', 2002),
('Abracadabra', 2020),
('Dearly Beloved', 2021),
('Железные мантры', 2008),
('Spitit', 2011),
('F5', 2011),
('Феникс', 2011);

INSERT INTO song(name, duration, album_id)
VALUES
-- Buck-Tick - Gessekai
('Gessekai', 306, 2),
('Muchi no Namida', 388, 2),
('My Baby Japanese', 268, 2),
-- Buck-Tick - Abracadabra
('Peace', 167, 5),
('Que Sera Sera Elegy', 289, 5),
('Urahara-Juku', 306, 5),
('Sophia Dream', 207, 5),
('Tsuki no Sabaku', 241, 5),
('Villain', 296, 5),
('Kogoeru Crystal Cube Ver.', 314, 5),
('Maimu Maimu', 232, 5),
('Dance Tengoku', 228, 5),
-- Ария - Герой Асфальта
('На службе силы зла', 430, 1),
('Герой асфальта', 311, 1),
('Мёртвая зона', 403, 1),
('1100', 295, 1),
('Улица роз', 356, 1),
('Баллада о древнерусском воине', 511, 1),
-- Daughtry - Dearly Beloved
('Desperation', 289, 6),
('World On Fire', 215, 6),
('Heavy Is The Crown', 235, 6),
('Changes Are Coming', 221, 6),
('Dearly Beloved', 223, 6),
('Cry for Help', 213, 6),
('Asylum', 235, 6),
('Evil', 212, 6),
('Break Into My Heart', 230, 6),
-- Дополнительно
('Мой рок-н-ролл', 405, 3),
('Зажигать', 321, 3),
('Мертвый анархист', 287, 4),
('Мой характер', 231, 4),
('Дом мой на двух ногах', 219, 7),
('Существо', 316, 7),
('Приоткроется дверь...', 143, 7);

INSERt iNTO collection(name, year)
VALUES
('Japanese rock', 2020),
('Russian rock', 2002),
('Grunge & alternative rock', 2021),
('Art rock', 2010);

INSERT INTO artist_genre(artist_id, genre_id)
VALUES
(1, 3),
(2, 1), (2, 8), (2, 9),
(3, 1), (3, 4), (3, 6),
(4, 5),
(5, 5), (5, 2),
(6, 2), (6, 3),
(7, 1), (7, 7), (7, 8),
(8, 1), (8, 4), (8, 6), (8, 7), (8, 8), (8, 9);

INSERT INTO artist_album(album_id, artist_id)
VALUES
(1, 1),
(2, 5),
(3, 2),
(4, 4),
(5, 5),
(6, 7),
(7, 9),
(8, 2),
(9, 3),
(10, 1);

INSERT INTO song_collection(collection_id, song_id)
VALUES
-- Japanese rock
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 25),
(1, 26),
-- Russian rock
(2, 11),
(2, 14),
(2, 15),
(2, 28),
(2, 29),
(2, 30),
(2, 32),
-- Grunge & alternative rock
(3, 18),
(3, 20),
(3, 22),
(3, 17),
(3, 24),
-- Art rock
(4, 28),
(4, 29),
(4, 32);
-- Задание 2

-- 1. Название и продолжительность самого длительного трека
SELECT name, duration
FROM song
ORDER BY duration DESC
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT name, duration
FROM song
WHERE duration >= 210
ORDER BY duration DESC;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name, year
FROM collection
WHERE year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artist
WHERE name NOT LIKE '% %' AND name NOT LIKE '%-%';

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT name
FROM song
WHERE name ILIKE '% my %' 
OR name ILIKE '% my'
OR name ILIKE 'my %'
OR name ILIKE 'my'
OR name ILIKE '% мой %' 
OR name ILIKE '% мой'
OR name ILIKE 'мой %'
OR name ILIKE 'мой';


-- Задание 3

-- 1. Количество исполнителей в каждом жанре
SELECT genre.name, COUNT(artist)
FROM genre
JOIN artist_genre AS ag ON ag.genre_id = genre.genre_id
JOIN artist ON ag.artist_id = artist.artist_id
GROUP BY genre.name
ORDER BY COUNT(artist);

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(song) AS song_amount
FROM album
JOIN song ON song.album_id = album.album_id
WHERE album.year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT album.name, ROUND(AVG(song.duration)) as avg
FROM song
JOIN album ON song.album_id = album.album_id
GROUP BY album.name
ORDER BY ROUND(AVG(song.duration));

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT artist.name
FROM artist
WHERE artist.name NOT IN (
	SELECT artist.name
	FROM artist_album as aa
	JOIN album ON aa.album_id = album.album_id
	JOIN artist ON aa.artist_id = artist.artist_id
	WHERE album.year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c.name
FROM collection c
JOIN song_collection sc ON sc.collection_id = c.collection_id
JOIN song ON song.song_id = sc.song_id
JOIN album ON song.album_id = album.album_id
JOIN artist_album aa ON aa.album_id = album.album_id
JOIN artist ON aa.artist_id = artist.artist_id
WHERE artist.name = 'Би-2';


-- Задание 4

-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT album.name, COUNT(genre) as genre_count
FROM artist_album aa
JOIN artist ON aa.artist_id = artist.artist_id
JOIN album ON aa.album_id = album.album_id
JOIN artist_genre ag ON ag.artist_id = artist.artist_id
JOIN genre ON ag.artist_id = genre.genre_id
GROUP BY album.name, artist.name
HAVING COUNT(genre) > 1;

-- 2. Наименования треков, которые не входят в сборники
SELECT song.name
FROM song
LEFT JOIN song_collection sc ON sc.song_id = song.song_id
WHERE sc.collection_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT artist.name, song.name, song.duration
FROM artist_album as aa
JOIN artist ON aa.artist_id = artist.artist_id
JOIN album ON aa.album_id = album.album_id
JOIN song ON album.album_id = song.album_id
WHERE song.duration = (SELECT MIN(song.duration) FROM song)
ORDER BY song.duration;

-- 4. Названия альбомов, содержащих наименьшее количество треков
SELECT album.name, COUNT(song.name) AS song_amount
FROM album 
JOIN song ON album.album_id = song.album_id
GROUP BY album.name
HAVING COUNT(song.name) = (
	SELECT COUNT(song)
	FROM album JOIN song ON album.album_id = song.album_id
	GROUP BY album.name
	ORDER BY count
	LIMIT 1
);


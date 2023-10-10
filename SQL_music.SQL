CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

INSERT INTO artist(name)
VALUES('The Killers'),('Arcade Fire'), ('LP'), ('Adriano Celentano'), ('David Guetta');

CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

INSERT INTO genre(name) 
VALUES('Rock'),('Pop'), ('Italiano'), ('Disco');

CREATE TABLE IF NOT EXISTS artistgenre (
	artist_id INTEGER NOT NULL REFERENCES artist(id),
	genre_id INTEGER NOT NULL REFERENCES genre(id)
);

INSERT INTO artistgenre(artist_id, genre_id) 
VALUES('1', '1'),('2', '1'), ('3', '2'), ('4', '3'), ('5', '4');

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	releaseyear INTEGER NOT NULL check(releaseyear>1900 and releaseyear<2024)
);

insert into album (name, releaseyear)
values('Hot Fuss','2004'),('Funeral','2004'),('Per sempre','2002')

CREATE TABLE IF NOT EXISTS artistalbum (
	artist_id INTEGER NOT NULL REFERENCES artist(id),
	album_id INTEGER NOT NULL REFERENCES album(id)
);

INSERT INTO artistalbum(artist_id, album_id) 
VALUES('1', '1'),('2', '2'), ('4', '3');

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL check(duration>0)
);

insert into track (name, duration)
values('Somebody Told Me','194'),('Smile Like You Mean It','235'),('Confessa','310'),('Rebellion Lies','311'),('Haiti','247'),('Pensieri nascosti','268');

CREATE TABLE IF NOT EXISTS va (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	releaseyear INTEGER NOT NULL check(releaseyear>1900 and releaseyear<2024)
);

insert into va(name, releaseyear)
values('Rock Stream', '2005'),('International music', '2008'),('Best of the best', '2004'),('VA from LA','2020')

CREATE TABLE IF NOT EXISTS vatracklist (
	va_id INTEGER NOT NULL REFERENCES va(id),
	track_id INTEGER NOT NULL REFERENCES track(id)
);

insert into vatracklist
values(1,1),(1,2),(2,4),(2,6),(3,2),(3,4),(4,3),(4,5);

select name, duration from track
where duration =(SELECT max(duration) from track);

select name from track
where duration > 210;

select name from va
where releaseyear between  2018 and 2020;

select name from artist
where name not like '% %';

select name from track
where name like '%my%' or name like '%мой%';

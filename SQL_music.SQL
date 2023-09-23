CREATE TABLE IF NOT EXISTS artist(
	artistid integer UNIQUE PRIMARY KEY,
	artist_name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre(
	genreid integer UNIQUE PRIMARY KEY,
	genre_name varchar(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genreofartist(
	artistid integer FOREIGN KEY REFERENCES artist(artistid),
	genreid integer FOREIGN KEY REFERENCES genre(genreid),
	PRIMARY KEY(artistid, genreid)
);

CREATE TABLE IF NOT EXISTS album(
	albumid integer UNIQUE PRIMARY KEY,
	album_name varchar(300) NOT NULL,
	album_year date NOT NULL
);

CREATE TABLE IF NOT EXISTS artistalbum(
	artistid integer FOREIGN KEY REFERENCES artist(artistid),
	albumid integer FOREIGN KEY REFERENCES album(albumid)
	PRIMARY KEY(artistid, albumid)
);

CREATE TABLE IF NOT EXISTS track(
	trackid integer UNIQUE PRIMARY KEY,
	track_name varchar(100) NOT NULL,
	albumid integer FOREIGN KEY REFERENCES album(albumid)
);

CREATE TABLE IF NOT EXISTS va(
	vaid integer UNIQUE PRIMARY KEY,
	va_name varchar(100) NOT NULL,
	va_year date NOT NULL
);

CREATE TABLE IF NOT EXISTS vatracklist(
	vaid FOREIGN KEY REFERENCES va(vaid),
	trackid FOREIGN KEY REFERENCES track(trackid)
);

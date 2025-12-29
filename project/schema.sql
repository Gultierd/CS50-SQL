-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- Represents users of the app
CREATE TABLE "Users"(
    "id" INTEGER,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represents music bands and artists
CREATE TABLE "Artist"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represents albums created by artists
CREATE TABLE "Album"(
    "id" INTEGER,
    "artist_id" INTEGER,
    "name" TEXT NOT NULL,
    "relased" NUMERIC DEFAULT CURRENT_DATE,
    PRIMARY KEY("id")
);

-- Represents a single track
CREATE TABLE "Song"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "length" INTEGER NOT NULL,
    "genre" TEXT,
    PRIMARY KEY("id")
);

-- Represents a relation between artists and songs - one song can be created by one or more artists
CREATE TABLE "SongProduces"(
    "song_id" INTEGER,
    "artist_id" INTEGER,
    FOREIGN KEY("song_id") REFERENCES "Song"("id"),
    FOREIGN KEY("artist_id") REFERENCES "Artist"("id")
);

-- Represents a relation between songs and albums - a single album can contain one or more songs
CREATE TABLE "AlbumContains"(
    "album_id" INTEGER,
    "song_id" INTEGER,
    FOREIGN KEY("song_id") REFERENCES "Song"("id"),
    FOREIGN KEY("album_id") REFERENCES "Album"("id")
);

-- Represents playlists created by users
CREATE TABLE "Playlist"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "user_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "User"("id")
);

-- Represents a relation between songs and playlists - each existing playlist contains at least one song
CREATE TABLE "PlaylistContains"(
    "playlist_id" INTEGER,
    "song_id" INTEGER,
    FOREIGN KEY("song_id") REFERENCES "Song"("id"),
    FOREIGN KEY("playlist_id") REFERENCES "Playlist"("id")
);

-- Represents a relation between users and songs - many users can like many songs
CREATE TABLE "UserLikes"(
    "user_id" INTEGER,
    "song_id" INTEGER,
    FOREIGN KEY("song_id") REFERENCES "Song"("id"),
    FOREIGN KEY("user_id") REFERENCES "User"("id")
);

-- Represents a single live event
CREATE TABLE "Concert"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represents a relation between artists and concert - One or more artists perform at a single concert
CREATE TABLE "ConcertPlays"(
    "concert_id" INTEGER,
    "artist_id" INTEGER,
    FOREIGN KEY("concert_id") REFERENCES "Concert"("id"),
    FOREIGN KEY("artist_id") REFERENCES "Artist"("id")
);

-- Creating views for easier preview
CREATE VIEW "ArtistSongs" AS
    SELECT Artist.name AS "Artist", Song.name AS "Song"
    FROM Artist JOIN SongProduces ON Artist.id = artist_id
    JOIN Song ON song_id = Song.id;

CREATE VIEW "PlaylistTracks" AS
    SELECT Playlist.name AS "Playlist", Song.name AS "Song"
    FROM Playlist JOIN PlaylistContains ON playlist_id = Playlist.id
    JOIN Song ON song_id = Song.id;

CREATE VIEW "AlbumTracks" AS
    SELECT Album.name AS "Album", Song.name AS "Song"
    FROM Album JOIN AlbumContains ON album_id = Album.id
    JOIN Song ON song_id = Song.id;

CREATE VIEW "LikedSongs" AS
    SELECT username AS "User", Song.name AS "Song"
    FROM User JOIN UserLikes ON user_id = User.id
    JOIN Song ON song_id = Song.id;

CREATE VIEW "ConcertView" AS
    SELECT Artist.name AS "Artist", Concert.name AS "Concert"
    FROM Concert JOIN ConcertPlays ON concert_id = Concert.id
    JOIN Artist ON artist_id = Artist.id;


-- Creating indexes for easier searching
CREATE INDEX "ArtistIndex" ON Artist("name");
CREATE INDEX "AlbumIndex" ON Album("name");
CREATE INDEX "PlaylistIndex" ON Playlist("name");
CREATE INDEX "UserIndex" ON User("username");

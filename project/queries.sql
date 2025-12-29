-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all information about the artist 'Led Zeppelin'
SELECT * FROM Artist
    WHERE name = 'Led Zeppelin';

-- Use the "PlaylistTracks" view to find all songs in a specific playlist
SELECT Song FROM PlaylistTracks
    WHERE "Playlist.name" = 'Road Trip Mix';

-- Insert values into UserLikes table to 'like' songs
INSERT INTO UserLikes ("user_id", "song_id")
    VALUES (
        (SELECT id FROM Users WHERE username = 'admin'),
        (SELECT id FROM Song WHERE name = 'Stairway to Heaven')
    );

-- Create a new user
INSERT INTO Users ("username", "password", "email")
    VALUES ("jon", "NFJN391NSD84N23", "mail@mail.com");

-- Remove an artist from all live events in a time period
DELETE FROM ConcertPlays
    WHERE artist_id =(
        SELECT id FROM Artist
        WHERE name = "Phil Collins"
    )
    AND concert_id =(
        SELECT id FROM Concert
        WHERE date LIKE "2025-10%"
    );

-- Shows playlists created by a user
SELECT name FROM Playlist
    WHERE user_id = (
        SELECT id FROM Users
        WHERE username = "jon"
    );

-- Shows all songs from a given artist
SELECT * FROM ArtistSongs
    WHERE Artist = "David Bowie";

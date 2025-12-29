# Design Document


## Scope

The database provides full backend data structures for a music applications. It stores, manages and relates informations about app's core components.
Scope of this database includes:
* Users - Their account credentials and identifying informations
* Artists - Musical artists or bands
* Albums - Collections of songs relased by artists
* Songs - Music tracks with details such as length and genre
* Playlists - Custom song collections created by users
* Concerts - Live music events, including location and date
* Relationships - All connections between these entities, songs in albums, in playlists, which artists play at different concerts, user liked songs

Out of scopes elements are audio files, analytics, social features, subscriptions or artists descriptions.

## Functional Requirements

Database is designed to support core application functionalities, such as:
* Creating and managind user accounts (changing data inside too)
* Searching for different songs, artists, albums, concerts
* Creating, populating and managing playlists by users
* Keeping track of user liked songs
* Viewing artists associated with a song or performing in a live event
* Viewing the tracklist for an album

And does not support non-core functionalities including streaming, downloading audio content, purchasing concert tickets, leaving ratings for songs

## Representation

Database includes following entities, represented as tables:

### Entities

#### Users
Stores information about application's users
* `id` - Integer serving as a unique identifier for each user, PRIMARY KEY
* `username` - Text serving as user's public name, required (NOT NULL),
* `password` - Text consisting of user's hashed password, required (NOT NULL)
* `email` - Text to store user's email address for account management, required (NOT NULL)

#### Artists
Represents musical artists and bands
* `id` - Integer serving as a unique identifier for each artist, PRIMARY KEY
* `name` - Text name of artist or band, required (NOT NULL)

#### Album
Stores information about music albums
* `id` - Integer serving as a unique identifier for each album, PRIMARY KEY
* `artist_id` - Integer serving as a link to the primary artist of a given album. FOREIGN KEY referencing `Artist`(`id`)
* `name` - Text name of the album, required (NOT NULL)
* `relased` - Relase date of the album, stored as numeric for flexibility. Defaults to current date (using `CURRENT_DATE` method) upon insertion

#### Song
Contains details for individual tracks
* `id` - Integer serving as a unique identifier for each song, PRIMARY KEY
* `name` - Text title of the song, required (NOT NULL)
* `length` - Integer duration of the song in seconds, required field (NOT NULL)
* `genre` - Text musical genre of the song, optional field

#### Playlist
Represents playlists created by users
* `id` - Integer serving as a unique identifier for each playlist, PRIMARY KEY
* `name` - Text title of the playlist, required (NOT NULL)
* `user_id` - Integer serving as a link between the playlist and the user who created it. FOREIGN KEY referencing `User`(`id`)

#### Concert
Stores information about live events
* `id` - Integer serving as a unique identifier for each song, PRIMARY KEY
* `name` - Text name of the tour, concert or event, required (NOT NULL)
* `date` - Numeric date and time of the event. Defaults to current time (using `CURRENT_TIMESTAMP`)
* `location` - Text being the location where the event takes place at, required (NOT NULL)

### Relationships

Below is the drawn Entity Relationships diagram:
![ER Diagram](diagram.png)

and as detailed:
* Artist can have many Albums, but Album is associated with one primary artist (One-to-many)
* Artist can be associated with many songs and song can be created by multiple artists, e.g. collaborations, being many-to-many relationship handled by `SongProduces` Table
* Album contains one or more Songs. This relationship is managed by `AlbumContains` table
* User can create many Playlists, but each playlist is owned by only one user (One-to-many)
* Playlist can contain many Songs, while songs can be included in many different playlists. Many-to-many relationship handled by `PlaylistContains` Table
* User can "like" many Songs, and song can be liked by many users. Many-to-many relationship handled by `UserLikes` Table
* Concert can feature multiple Artists, and each artist can perform at many concerts. Many-to-many relationship handled by `ConcertPlays` Table

## Optimizations

To improve overall query performance for common search operations, several optimizations have been implemented.
Multiple indexes were created on columns used frequently in search queries:
* `AristIndex`
* `AlbumIndex`
* `PlaylistIndex`
* `UserIndex`
All of which were made on names of that given entity.

Also multiple views were created to simplify JOIN queries, acting as virtual tables providing a simple way to reach related data:
* `PlaylistTrack` - Containing songs for each playlist name,
* `AlbumTracks` - Containing songs for each album name,
* `LikedSongs` - Containing songs for each username,
* `ConcertView` - Containing artist names for each concert.

## Limitations

Current design has several limitations, such as:
Static playlist ordering, with no way to store the order of tracks within a playlist. All songs being an unordered set
No versioning for songs, so different versions of a single song must be stored as a separate entity
Limited live event details, not including ticket prices, setlists, supporting acts on all concerts

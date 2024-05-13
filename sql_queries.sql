-- select * FROM Track;

-- Get track listings for a single album
-- SELECT
--     Track.Name AS Track, 
--       Album.Title AS Album
-- FROM 
--     Track JOIN Album
-- ON
--     Track.AlbumId = Album.AlbumId
-- WHERE
--     Album.Title = 'Nevermind';

-- This pulls up a table with two columns, track and 
-- album, and it displays all of the tracks on the 
-- album 'Nevermind'

------------------------------------------------------

-- Show only columns we want to show 

-- SELECT 
--     Track.Name, Album.Title, Track.GenreId 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId
-- -- WHERE 
-- --     Album.Title = 'Nevermind';
-- This pulled up the name album and genre type for
-- all the songs on the album Nevermind

----------------------------------------------------
-- Get Track Listings for all albums by Nirvana 


-- SELECT 
--     Track.Name, Album.Title, Artist.Name, Genre.Name 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     Genre ON Track.GenreId = Genre.GenreId
-- WHERE 
--     Artist.Name = 'Nirvana';

-- This pulls up a table that displays in ordeR: track 
-- name, album title, artist name, and genre name; It 
-- is only pulling things that have an artist name 'Nirvana'

-----------------------------------------------------
-- Three columns are named 'Name'; Assign aliases to the
-- SELECT columns so they're unambiguous 

-- SELECT 
--     Track.Name AS Track, 
--     Album.Title AS Album, 
--     Artist.Name AS Artist, 
--     Genre.Name AS Genre
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     Genre ON Track.GenreId = Genre.GenreId
-- WHERE 
--     Artist.Name = 'Nirvana';

-- This just changes the names of the columns at top
-----------------------------------------------------
-- Use wildcard operator % to find tracks with 'Dog' in 
-- the name from any album/any artist 

-- SELECT 
--     Track.Name AS Track, 
--     Album.Title AS Album, 
--     Artist.Name AS Artist, 
--     Genre.Name AS Genre 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     Genre ON Track.GenreId = Genre.GenreId 
-- WHERE 
--     Track.Name LIKE '%Dog%';

--This finds all tracks with Dog in the title

-----------------------------------------------------
--Narrow results down to just a single artist 

-- SELECT 
--     Track.Name AS Track, 
--     Album.Title AS Album, 
--     Artist.Name AS Artist, 
--     Genre.Name AS Genre 
-- FROM Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     Genre ON Track.GenreId = Genre.GenreId 
-- WHERE 
--     Track.Name LIKE '%Dog%' 
-- AND 
--     Artist.Name = 'Led Zeppelin';

--This finds all tracks with dog in the title by Led Zep
-----------------------------------------------------
-- Get familiar with the Playlist and PlaylistTrack tables 
-- SELECT * FROM Playlist;
-- SELECT * FROM PlaylistTrack;

--Looks up playlists and then gives all the playlist ids
-- and track ids (all numbers yuck)
-----------------------------------------------------
-- Find all the tracks from one playlist by playlist name 

-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track 
-- FROM 
--     Track 
-- JOIN 
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Playlist.Name = 'Grunge';

--This pulled up the grunge playlist and it's tracks
-----------------------------------------------------
-- If we want to include the artist along with the track… 

-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track, 
--     Artist.Name as Artist 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Playlist.Name = 'Grunge';

--Same as last but with artist key
-----------------------------------------------------
-- Find all the playlists that include artist Nirvana 

SELECT 
    Playlist.Name as Playlist, 
    Track.Name As Track, 
    Artist.Name as Artist 
FROM 
    Track 
JOIN 
    Album ON Track.AlbumId = Album.AlbumId,
    Artist ON Album.ArtistId = Artist.ArtistId,
    PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
    Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
WHERE 
    Artist.Name = 'Nirvana';

-- lists every full playlist that includes Nirvana
-----------------------------------------------------
-- Alphabetize the ‘Music’ playlists, Add an ORDER BY clause 

-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track,
--      Artist.Name as Artist 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId, 
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
-- WHERE 
--     Artist.Name = 'Nirvana' 
-- ORDER BY 
--     Playlist.Name;

-- Ordered all of the lists by the playlist name alphabetically
-----------------------------------------------------
-- Or we could sort by track name 

-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track, 
--     Artist.Name as Artist 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId, 
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Artist.Name = 'Nirvana' 
-- ORDER BY 
--     Track.Name;

-- Provides same information by organized by track name
-----------------------------------------------------
-- It looks like there are duplicate tracks in our results 

-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track, 
--     Artist.Name as Artist, 
--     Album.Title as Title 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId, 
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Artist.Name = 'Nirvana' 
-- ORDER BY 
--     Track.Name;

--This is the same as last list but no duplicates
-----------------------------------------------------
--Wanted to only see unique track names on each playlist… 
-- SELECT 
--     Playlist.Name as Playlist, 
--     Track.Name As Track, 
--     Artist.Name as Artist 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Artist.Name = 'Nirvana'
-- GROUP BY 
--     Playlist.Name, Track.Name 
-- ORDER BY 
--     Playlist.Name, Track.Name;

-- This groups our results by playlist and trackname 
-----------------------------------------------------
-- How many times is each Nirvana song included in different playlists 
-- Use the COUNT aggregate function and a GROUP BY clause 

-- SELECT 
--     COUNT(Playlist.Name) as PlaylistAppearances, 
--     Track.Name As Track, 
--     Artist.Name as Artist 
-- FROM 
--     Track 
-- JOIN 
--     Album ON Track.AlbumId = Album.AlbumId,
--     Artist ON Album.ArtistId = Artist.ArtistId,
--     PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
--     Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
-- WHERE 
--     Artist.Name = 'Nirvana' 
-- GROUP BY 
--     Track.Name 
-- ORDER BY 
--     PlaylistAppearances DESC;

--You can order by the count of playlist appearances
-----------------------------------------------------
--Figure out total cost for each playlist 

SELECT 
    SUM(Track.UnitPrice) as TotalCost, 
    Playlist.Name as Playlist 
FROM 
    Track 
JOIN 
    PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId,
    Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId 
GROUP BY Playlist.Name;

-- Presents a table with the total cost of all the songs in a playlist 





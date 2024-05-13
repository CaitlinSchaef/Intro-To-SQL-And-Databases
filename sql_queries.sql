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
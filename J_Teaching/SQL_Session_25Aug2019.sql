 /* This is how you comment
 multiple lines at a time
 Got it!! */
 
 -- You can use the SELECT statement to perform a simple 
 -- calculation as follows:
SELECT
 1 + 4;
 -- SOLVE - ? How do you give name to column here?
 
 -- You can use multiple expressions in the SELECT statement as follows:
 -- Select a few columns from tracks table in DB
SELECT
 trackid,
 name,
 composer,
 unitprice
FROM
 tracks;
 
 /* SOLVE- ? How to select All the columns from tracks table? 
 - Way/s - Which one is easier and which is recommended? */
 
-- Get the cities from where customer belongs



SELECT
 city
FROM
 customers; 
 -- SOLVE - ? What is the issue with above query?
 
 
 -- Use of DISTINCT
SELECT DISTINCT
 city
FROM
 customers;
 
 -- SOLVE - ? Get the companies of the customers
 -- What is unusual about result? 
 
SELECT
 company
FROM
 customers;
 
SELECT DISTINCT
 company
FROM
 customers;
 
 -- USE OF ORDER BY
 -- Get data - name, milliseconds, and album id columns form tracks
SELECT
 name,
 milliseconds, 
        albumid
FROM
 tracks;
 
 -- Now get the same data sorted based on AlbumId column in ascending order
SELECT
 name,
 milliseconds, 
 albumid
FROM
 tracks
ORDER BY
 albumid ASC;
 
-- Now sort the sorted result (by AlbumId) above...
-- by the Milliseconds column in descending order

SELECT
 name,
 milliseconds, 
 albumid
FROM
 tracks
ORDER BY
 albumid ASC,
        milliseconds DESC;
	
-- Using column positions in ORDER BY	
SELECT
 name,
 milliseconds, 
 albumid
FROM
 tracks
ORDER BY
 3,2;
 
-- Use of LIMIT clause
-- get the first 10 rows in the tracks table
SELECT
 trackId,
 name
FROM
 tracks
LIMIT 10;

-- get 10 rows starting from the 10th row in the tracks table
SELECT
 trackId,
 name
FROM
 tracks
LIMIT 10 OFFSET 10;

-- SOLVE: get the top 10 largest tracks in MB




SELECT
 trackid,
 name,
 bytes
FROM
 tracks
ORDER BY
 bytes DESC
LIMIT 10;

-- SOLVE NUGGET - ? Get all customers and their first name where company is missing
-- select customerid, firstname, company 
--from customers
--where company is NULL;

--Use of where clause
-- Get all tracks in the album id 1

SELECT
 name,
 milliseconds,
  bytes,
 albumid
FROM
 tracks
WHERE
 albumid = 1;
 
 -- SOLVE: Get tracks on the album 1 that have the length greater than 250,000 milliseconds
 
 
 
SELECT
 name,
 milliseconds,
 bytes,
 albumid
FROM
 tracks
WHERE
 albumid = 1
AND milliseconds &gt; 250000;


-- Find which tracks are composed by all people with 'Smith' in thier names
-- Wildcard characters
SELECT
 name,
 albumid,
 composer
FROM
 tracks
WHERE
 composer LIKE '%Smith%'
ORDER BY
 albumid;
 
 -- Use of wildcards % and _
SELECT
 trackid,
 name 
FROM
 tracks
WHERE
 name LIKE 'Wild%';
 
SELECT
 trackid,
 name
FROM
 tracks
WHERE
 name LIKE '%Wild';
 
SELECT
 trackid,
 name 
FROM
 tracks
WHERE
 name LIKE '%Wild%';
 
 
 -- SOLVE: Find tracks that have media type id 2 or 3 
 
 
 SELECT
 name,
 albumid,
 mediatypeid
FROM
 tracks
WHERE
 mediatypeid = 2 or mediatypeid = 3;
 
 -- SOLVE: What if I have to chose data for more than 25 different media types (hypothetically)?
 
 
 
 --Use of IN operator and Not In operator
SELECT
 name, albumid, mediatypeid
FROM
 tracks
WHERE
 mediatypeid IN (2, 3);
 
 -- list of tracks whose genre id is not in a list of (1,2,3)
SELECT
 trackid,
 name,
 genreid
FROM
 tracks
WHERE
 genreid NOT IN (1,2,3);
 
 
-- Use of BETWEEN operator
 -- finds invoices whose total is between 14.91 and 18.86:
SELECT
    InvoiceId,
    BillingAddress,
    Total
FROM
    invoices
WHERE
    Total BETWEEN 14.91 and 18.86    
ORDER BY
    Total; 
 
 	
-- SOLVE: find the invoices whose total are less than 1 or greater than 20





SELECT
    InvoiceId,
    BillingAddress,
    Total
FROM
    invoices
WHERE
    Total NOT BETWEEN 1 and 20
ORDER BY
    Total;    

	
-- finds invoices whose invoice dates are from January 1 2010 and January 31 2010:
SELECT
    InvoiceId,
    BillingAddress,
    InvoiceDate,
    Total
FROM
    invoices
WHERE
    InvoiceDate BETWEEN '2010-01-01' AND '2010-01-31'
ORDER BY
    InvoiceDate;


	
 -- Get the tracks that belong to the artist id = 12 
 -- Subqueries
 
 
 SELECT
 trackid,
 name,
 albumid
FROM
 tracks
WHERE
	 albumid IN (
		 SELECT
		 albumid
		 FROM
		 albums
		 WHERE
		 artistid = 12
	 );

	 
	 
-- JOINS
-- Inner join

-- get the album titles for all tracks
SELECT
 trackid,
 name,
 title
FROM
 tracks
INNER JOIN albums ON albums.albumid = tracks.albumid;



-- How do you validate join is correct?
SELECT
    trackid,
    name,
    tracks.albumid AS album_id_tracks,
    albums.albumid AS album_id_albums,
    title
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid;


-- SOLVE - ? How to get tracks and albums of artist with ID = 10




SELECT
 trackid,
 tracks.name AS Track,
 albums.title AS Album,
 artists.name AS Artist
FROM
 tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
INNER JOIN artists ON artists.artistid = albums.artistid
WHERE
 artists.artistid = 10;
 
 
 -- SOLVE: Find the artists who do not have any albums
 
 
SELECT
 artists.ArtistId,
 albumId
FROM
 artists
LEFT JOIN albums ON albums.artistid = artists.artistid
ORDER BY
 albumid;
 
--OR
 SELECT
 artists.ArtistId,
 albumId
FROM
 artists
LEFT JOIN albums ON albums.artistid = artists.artistid
WHERE
 albumid IS NULL;


-- Note - SQLite does not support RIGHT JOIN and FULL OUTER join
 
 -- GROUP BY
 -- Find the number of tracks per album
 
SELECT
 albumid,
 COUNT(trackid) as track_count
FROM
 tracks
GROUP BY
 albumid;

 -- order above result by count of tracks
SELECT
 albumid,
 COUNT(trackid) as track_count
FROM
 tracks
GROUP BY
 albumid
ORDER BY 2 DESC;

-- Get the number of tracks per album along with album title

select a.albumID , b.title, count (trackid) as track_count
from 
tracks  as a
left join
albums as b on a.albumid = b.albumid
group by 1,2;

-- GROUP BY with HAVING clause - to filter by aggregate value in group by
-- get the albums that have more than 15 tracks

SELECT
 tracks.albumid,
 title,
 COUNT(trackid)
FROM
 tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
GROUP BY
 tracks.albumid
HAVING COUNT(trackid) &gt; 15;

-- Get total length and bytes for each album
SELECT
 albumid,
 sum(milliseconds) as length,
 sum(bytes) as size
FROM
 tracks
GROUP BY
 albumid;
 
 -- Get the album id, album title, maximum, minimum and the average length of tracks
 SELECT
 tracks.albumid,
 title,
 min(milliseconds),
 max(milliseconds),
 round(avg(milliseconds),2)
FROM
 tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
GROUP BY
 tracks.albumid;
 
 -- Get count of tracks by media type and genre
SELECT
 mediatypeid,
 genreid,
 count(trackid)
FROM
 tracks
GROUP BY
 mediatypeid,
 genreid;
 
-- find albums that have the total length greater than 60,000,000 milliseconds
SELECT
 tracks.albumid,
 title,
 sum(Milliseconds) AS length
FROM
 tracks
INNER JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY
 tracks.albumid
HAVING
 length &gt; 60000000;

-- SQL Subquery
-- Find all the tracks in the album with the title Let There Be Rock

SELECT trackid,
       name,
       tracks.albumid
  FROM tracks left join albums
  on tracks.albumid = albums.albumid
 where albums.Title = 'Let There Be Rock';
 
 --OR
 SELECT trackid,
       name,
       albumid
  FROM tracks
 WHERE albumid = (
                     SELECT albumid
                       FROM albums
                      WHERE title = 'Let There Be Rock'
                 );

				 
				 
--  Find the customers whose sales representatives are in Canada
SELECT customerid,
       firstname,
       lastname
  FROM customers
 WHERE supportrepid IN (
           SELECT employeeid
             FROM employees
            WHERE country = 'Canada'
       );
	   
--OR
SELECT a.customerid,
       a.firstname,
       a.lastname
  FROM customers as a LEFT join employees as b
  on a.SupportRepId = b.EmployeeID
  where b.country = 'Canada';

  
-- Get average album size in bytes
SELECT avg(album.size) 
  FROM (
           SELECT sum(bytes) as size
             FROM tracks
            GROUP BY albumid
       )
       AS album;
	   
-- Correlate Subquery?? Let' not cover in scope

-- INSERT ROWS in TABLES

-- single row
INSERT INTO artists (name)
VALUES
 ('Bud Powell');
 
 -- multiple rows
 INSERT INTO artists (name)
VALUES
 (&quot;Buddy Rich&quot;),
 (&quot;Candido&quot;),
 (&quot;Charlie Byrd&quot;);
 
 -- create backup of artists
 CREATE TABLE artists_backup(
 artistid INTEGER PRIMARY KEY AUTOINCREMENT,
 name NVARCHAR
);
INSERT INTO artists_backup SELECT
 artistid,
 name
FROM
 artists;
 
 -- SQL Update
 -- Update the last name of Jane (emp id = 3) as she got married to a Smith
UPDATE employees
SET lastname = 'Peacock'
WHERE
 employeeid = 3;
 
 /* Suppose Park Margaret locates in Toronto and you want to change his address, 
 city, and state information.*/
 
 UPDATE employees
SET city = 'Toronto',
    state = 'ON',
    postalcode = 'M5P 2N7'
WHERE
    employeeid = 4;

-- Deleting rows from table
DELETE
FROM
 artists_backup
WHERE
 artistid = 1;
 -- Delete based on condition
DELETE
FROM
 artists_backup
WHERE
 name LIKE '%Santana%';
 
 -- Removing all rows of database
 DELETE
FROM
 artists_backup;
 
-- Dropping a table
drop table artists_backup;
CREATE DATABASE record_company; #create the database
USE record_company; #indicating what database we are going to use
CREATE TABLE bands ( #creating the table
	id INT NOT NULL AUTO_INCREMENT, #column 1: id column as an standard for numering, auto incrementing as we add new bands to the column
	name VARCHAR(255) NOT NULL, #column 2: in order: name of the column, character length, no null values allowed
    PRIMARY KEY (id) #id is the primary key column
);
    
CREATE TABLE albuns (
	id INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    release_year INT,
	band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands (id) #references to another table
);

#inserting values to the tables created
INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged'), ('Ankor');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id as 'ID', name AS 'Band Name' FROM bands; #'as' indicates how you name the columns

SELECT * FROM bands ORDER BY name ASC;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albuns (name, release_year, band_id)
VALUES ('The Number of the Beasts', 1985, 1),
		('Power Slave', 1984, 1),
		('Nightmare', 2018, 2),
        ('Nightmare', 2010, 3),
        ('Test Albun', NULL, 3);

SELECT * FROM albuns;

SELECT DISTINCT name FROM albuns; #select only unique values

UPDATE albuns 
SET release_year = 1982
WHERE id = 1;


#filtering the values in the table

SELECT * FROM albuns
WHERE release_year < 2000;

SELECT * FROM albuns
WHERE name LIKE '%er%' OR band_id = 2; #select string values like the one indicated

SELECT * FROM albuns
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albuns
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albuns
WHERE release_year IS NULL;

DELETE FROM  albuns WHERE id = 5; #deletes values or columns

SELECT * FROM albuns;


#'join' values from different tables
SELECT * FROM bands
INNER JOIN albuns ON bands.id = albuns.band_id;

SELECT * FROM bands
LEFT JOIN albuns ON bands.id = albuns.band_id;

SELECT * FROM bands
RIGHT JOIN albuns ON bands.id = albuns.band_id;

SELECT SUM(release_year) FROM albuns
GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;


 












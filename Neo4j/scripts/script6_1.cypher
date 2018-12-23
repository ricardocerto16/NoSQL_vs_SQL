USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_text.csv" AS line8 FIELDTERMINATOR ';'

CREATE (fil_text:Film_Text{	Id: line8.film_id, Title: line8.title, Description: line8.description})
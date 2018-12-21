USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/actor.csv" AS line FIELDTERMINATOR ';'

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/city.csv" AS line3 FIELDTERMINATOR ';'

CREATE (:Actor { Id: line.actor_id, First_Name: line.first_name, Last_Name: line.last_name, Last_Update: line.last_update})

CREATE (:City{ Id: line3.city_id, City_Name: line3.city, Country_ID: line3.country_id, Last_Update: line3.last_update})
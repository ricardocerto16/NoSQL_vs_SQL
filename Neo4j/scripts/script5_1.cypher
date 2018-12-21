USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_actor.csv" AS line6 FIELDTERMINATOR ';'

CREATE (:Film_Actor{ Id: line6.actor_id, Film_ID: line6.film_id, Last_Update: line6.last_update})
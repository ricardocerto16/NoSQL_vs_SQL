USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film.csv" AS line9 FIELDTERMINATOR ';'


CREATE (:Film{ Id: line9.film_id, Title: line9.title, Description: line9.description, Release_Year: line9.release_year, Language_ID: line9.language_id, Original_Language: line9.original_language_id, Rental_Duration: line9.rental_duration, Rental_Rate: line9.rental_rate, Length: line9.length, Replacement_Cost: line9.replacement_cost, Rating: line9.rating, Special_Features: line9.special_features, Last_Update: line9.last_update})

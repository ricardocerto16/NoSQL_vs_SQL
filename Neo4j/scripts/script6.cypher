USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_category.csv" AS line7 FIELDTERMINATOR ';'

CREATE (:Film_Category{ Film_ID: line7.film_id, Category_ID: line7.category_id, Last_Update: line7.last_update})


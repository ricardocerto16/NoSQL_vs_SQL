USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/category.csv" AS line2 FIELDTERMINATOR ';'

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS line15 FIELDTERMINATOR ';'

CREATE (cat: Category{ Id: line2.category_id, Name: line2.name, Last_Update: line2.last_update})

CREATE (sto: Store{ Id: line15.store_id, Manager_Staff_ID: line15.manager_staff_id, Last_Update: line15.last_update})
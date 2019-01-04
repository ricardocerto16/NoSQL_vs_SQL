USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/customer.csv" AS line5 FIELDTERMINATOR ';'

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/language.csv" AS line11 FIELDTERMINATOR ';'

CREATE (cust: Customer{ Id: line5.customer_id, Store_ID: line5.store_id, First_Name: line5.first_name, Last_Name: line5.last_name, Email: line5.email, Address_ID: line5.address_id, Active: line5.active, Creation_Date: line5.creation_date, Last_Update: line5.last_update})

CREATE (lan: Language{ Id: line11.language_id, Name: line11.name, Last_Update: line11.last_update})
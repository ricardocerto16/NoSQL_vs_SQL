USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/staff.csv" AS line14 FIELDTERMINATOR ';'


CREATE (staf: Staff{ Id: line14.staff_id, First_Name: line14.first_name, Last_Name: line14.last_name, Address_ID: line14.address_id, Picture: line14.picture, Email: line14.email, Store_ID: line14.store_id, Active: line14.active, Username: line14.username, Password: line14.password, Last_Update: line14.last_update})

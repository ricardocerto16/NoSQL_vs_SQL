USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS line13 FIELDTERMINATOR ';'

CREATE (rent: Rental{ Id: line13.rental_id, Rental_Date: line13.rental_date, Inventory_Id: line13.inventory_id, Customer_ID: line13.customer_id, Return_Date: line13.return_date, Staff_ID: line13.staff_id, Last_Update: line13.last_update})


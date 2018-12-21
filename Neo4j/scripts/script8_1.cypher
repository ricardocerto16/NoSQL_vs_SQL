USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS line12 FIELDTERMINATOR ';'

CREATE (:Payment{ Id: line12.payment_id, Customer_ID: line12.customer_id, Satff_ID: line12.staff_id, Rantal_ID: line12.rental_id, Amount: line12.amount, Payment_Date: line12.payment_date, Last_Update: line12.last_update})
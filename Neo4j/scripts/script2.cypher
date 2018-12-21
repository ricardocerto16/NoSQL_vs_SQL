USING PERIODIC COMMIT 500

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/country.csv" AS line4 FIELDTERMINATOR ';'

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/address.csv" AS line1 FIELDTERMINATOR ';'

CREATE (:Country{ Id: line4.country_id, Country_Name: line4.country, Last_Update: line4.last_update})

CREATE (:Address{ Id: line1.address_id, Address: line1.address, Address_2: line1.address2, District: line1.district, City_ID: line1.city_id, Postal: line1.postal_code, Phone: line1.phone, Location: line1.location, Last_Update: line1.last_update})

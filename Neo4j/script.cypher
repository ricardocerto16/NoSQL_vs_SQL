USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/actor.csv" AS line FIELDTERMINATOR ';'

CREATE (:Actor { Id: line.actor_id, First_Name: line.first_name, Last_Name: line.last_name, Last_Update: line.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/address.csv" AS line1 FIELDTERMINATOR ';'

CREATE (:Address{ Id: line1.address_id, Address: line1.address, Address_2: line1.address2, District: line1.district, City_ID: line1.city_id, Postal: line1.postal_code, Phone: line1.phone Location: line1.location, Last_Update: line1.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/category.csv" AS line2 FIELDTERMINATOR ';'

CREATE (:Category{ Id: line2.category_id, Name: line2.name, Last_Update: line2.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/city.csv" AS line3 FIELDTERMINATOR ';'

CREATE (:City{ Id: line3.city_id, City_Name: line3.city, Country_ID: line3.country_id, Last_Update: line3.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/country.csv" AS line4 FIELDTERMINATOR ';'

CREATE (:Country{ Id: line4.country_id, Country_Name: line4.country, Last_Update: line4.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/customer.csv" AS line5 FIELDTERMINATOR ';'

CREATE (:Customer{ Id: line5.customer_id, Store_ID: line5.store_id, First_Name: line5.first_name, Last_Name: line5.last_name, Email: line5.email, Address_ID: line5.address_id, Active: line5.active, Creation_Date: line5.creation_date, Last_Update: line5.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_actor.csv" AS line6 FIELDTERMINATOR ';'

CREATE (:Film_Actor{ Id: line6.actor_id, Film_ID: line6.film_id, Last_Update: line6.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_category.csv" AS line7 FIELDTERMINATOR ';'

CREATE (:Film_Category{ Film_ID: line7.film_id, Category_ID: line7.category_id, Last_Update: line7.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_text.csv" AS line8 FIELDTERMINATOR ';'

CREATE (:Film_Text{	Id: line8.film_id, Title: line8.title, Description: line8.description})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film.csv" AS line9 FIELDTERMINATOR ';'

CREATE (:Film{ Id: line9.film_id, Title: line9.title, Description: line9.description, Release_Year: line9.release_year, Language_ID: line9.language_id, Original_Language: line9.original_language_id, Rental_Duration: line9.rental_duration, Rental_Rate: line9.rental_rate, Length: line9.length, Replacement_Cost: line9.replacement_cost, Rating: line9.rating, Special_Features: line9.special_features, Last_Update: line9.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/inventory.csv" AS line10 FIELDTERMINATOR ';'

CREATE (:Inventory{ Id: line10.inventory_id, Film_ID: line10.film_id, Store_ID: line10.store_id, Last_Update: line10.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/language.csv" AS line11 FIELDTERMINATOR ';'

CREATE (:Language{ Id: line11.language_id, Name: line11.name, Last_Update: line11.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS line12 FIELDTERMINATOR ';'

CREATE (:Payment{ Id: line12.payment_id, Customer_ID: line12.customer_id, Satff_ID: line12.staff_id, Rantal_ID: line12.rental_id, Amount: line12.amount, Payment_Date: line12.payment_date, Last_Update: line12.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS line13 FIELDTERMINATOR ';'

CREATE (:Rental{ Id: line13.rental_id, Rental_Date: line13.rental_date, Inventory_Id: line13.inventory_id, Customer_ID: line13.customer_id, Return_Date: line13.return_date, Staff_ID: line13.staff_id, Last_Update: line13.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/staff.csv" AS line14 FIELDTERMINATOR ';'

CREATE (:Staff{ Id: line14.staff_id, First_Name: line14.first_name, Last_Name: line14.last_name, Address_ID: line14.address_id, Picture: line14.picture, Email: line14.email, Store_ID: line14.store_id, Active: line14.active, Username: line14.username, Password: line14.password, Last_Update: line14.last_update})


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS line15 FIELDTERMINATOR ';'

CREATE (:Store{ Id: line15.store_id, Manager_Staff_ID: line15.manager_staff_id, Last_Update: line15.last_update})


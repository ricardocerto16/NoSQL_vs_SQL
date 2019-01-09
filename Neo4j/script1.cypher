USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/actor.csv" AS line FIELDTERMINATOR ';'

CREATE (: Actor { actor_ID: line.actor_id, First_Name: line.first_name, Last_Name: line.last_name, Last_Update: line.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/city.csv" AS line3 FIELDTERMINATOR ';'

CREATE (: City{ city_ID: line3.city_id, City_Name: line3.city, Country_ID: line3.country_id, Last_Update: line3.last_update});


USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/country.csv" AS line4 FIELDTERMINATOR ';'

CREATE (: Country{ country_ID: line4.country_id, Country_Name: line4.country, Last_Update: line4.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/address.csv" AS line1 FIELDTERMINATOR ';'

CREATE (: Address{ address_ID: line1.address_id, Address: line1.address, Address_2: line1.address2, District: line1.district, City_ID: line1.city_id, Postal: line1.postal_code, Phone: line1.phone, Location: line1.location, Last_Update: line1.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/category.csv" AS line2 FIELDTERMINATOR ';'

CREATE (: Category{ category_ID: line2.category_id, Name: line2.name, Last_Update: line2.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS line15 FIELDTERMINATOR ';'

CREATE (sto: Store{ store_ID: line15.store_id, Manager_Staff_ID: line15.manager_staff_id, Last_Update: line15.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/customer.csv" AS line5 FIELDTERMINATOR ';'

CREATE (: Customer{ customer_ID: line5.customer_id, Store_ID: line5.store_id, First_Name: line5.first_name, Last_Name: line5.last_name, Email: line5.email, Address_ID: line5.address_id, Active: line5.active, Creation_Date: line5.creation_date, Last_Update: line5.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/language.csv" AS line11 FIELDTERMINATOR ';'

CREATE (: Language{ language_ID: line11.language_id, Name: line11.name, Last_Update: line11.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film.csv" AS line9 FIELDTERMINATOR ';'

CREATE (: Film{ film_ID: line9.film_id, Title: line9.title, Description: line9.description, Release_Year: line9.release_year, Language_ID: line9.language_id, Original_Language: line9.original_language_id, Rental_Duration: line9.rental_duration, Rental_Rate: line9.rental_rate, Length: line9.length, Replacement_Cost: line9.replacement_cost, Rating: line9.rating, Special_Features: line9.special_features, Last_Update: line9.last_update});


USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_actor.csv" AS line6 FIELDTERMINATOR ';'

CREATE (: Film_Actor{ film_actor_ID: line6.actor_id, Film_ID: line6.film_id, Last_Update: line6.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_category.csv" AS line7 FIELDTERMINATOR ';'

CREATE (fil_cat: Film_Category{ cat_film_ID: line7.film_id, Category_ID: line7.category_id, Last_Update: line7.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_text.csv" AS line8 FIELDTERMINATOR ';'

CREATE (fil_text: Film_Text{ text_film_ID: line8.film_id, Title: line8.title, Description: line8.description});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/inventory.csv" AS line111 FIELDTERMINATOR ';'

CREATE (:Inventory{inventory_ID: line111.inventory_id, Film_ID: line111.film_id, Store_ID: line111.store_id, Last_Update: line111.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/staff.csv" AS line14 FIELDTERMINATOR ';'

CREATE (staf: Staff{ staff_ID: line14.staff_id, First_Name: line14.first_name, Last_Name: line14.last_name, Address_ID: line14.address_id, Picture: line14.picture, Email: line14.email, Store_ID: line14.store_id, Active: line14.active, Username: line14.username, Password: line14.password, Last_Update: line14.last_update});

USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS line13 FIELDTERMINATOR ';'

CREATE (rent: Rental{ rental_ID: line13.rental_id, Rental_Date: line13.rental_date, Inventory_Id: line13.inventory_id, Customer_ID: line13.customer_id, Return_Date: line13.return_date, Staff_ID: line13.staff_id, Last_Update: line13.last_update});


USING PERIODIC COMMIT 100

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS line12 FIELDTERMINATOR ';'

CREATE (pay: Payment{ payment_ID: line12.payment_id, Customer_ID: line12.customer_id, Satff_ID: line12.staff_id, Rantal_ID: line12.rental_id, Amount: line12.amount, Payment_Date: line12.payment_date, Last_Update: line12.last_update});


CREATE INDEX ON :Actor(actor_ID);
CREATE INDEX ON :City(city_ID);
CREATE INDEX ON :Country(country_ID);
CREATE INDEX ON :Address(address_ID);
CREATE INDEX ON :Category(category_ID);
CREATE INDEX ON :Store(store_ID);
CREATE INDEX ON :Customer(customer_ID);
CREATE INDEX ON :Language(language_ID);
CREATE INDEX ON :Film(film_ID);
CREATE INDEX ON :Staff(staff_ID);
CREATE INDEX ON :Rental(rental_ID);
CREATE INDEX ON :Payment(payment_ID);


//---------------------------------------- RELAÇÕES ------------------------------------------

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/city.csv" AS row1 FIELDTERMINATOR ';'

MATCH (cit:City{city_ID: row1.city_id})
MATCH (cnty:Country{country_ID: row1.country_id})
MERGE (cit)-[:IS_IN]->(cnty);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/address.csv" AS row1 FIELDTERMINATOR ';'

MATCH (add:Address{address_ID: row1.address_id})
MATCH (city:City{city_ID: row1.city_id})
MERGE (city)-[:HAS_ADDRESS]->(add);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS row1 FIELDTERMINATOR ';'

MATCH (add:Address{address_ID: row1.address_id})
MATCH (store:Store{store_ID: row1.store_id})
MERGE (store)-[:IS_LOCATED]->(add);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS row1 FIELDTERMINATOR ';'

MATCH (staff_manager:Staff{staff_ID: row1.manager_staff_id})
MATCH (store:Store{store_ID: row1.store_id})
MERGE (store)-[:MANAGED_BY]->(staff_manager);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS row1 FIELDTERMINATOR ';'

MATCH (add:Address{address_ID: row1.address_id})
MATCH (customer:Customer{customer_ID: row1.customer_id})
MERGE (customer)-[:LIVES_IN]->(add);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/store.csv" AS row1 FIELDTERMINATOR ';'

MATCH (store:Store{store_ID: row1.store_id})
MATCH (customer:Customer{customer_ID: row1.customer_id})
MERGE (customer)-[:SHOPS]->(store);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film:Film{film_ID: row1.film_id})
MATCH (language:Language{language_ID: row1.language_id})
MERGE (film)-[:SPOKE_IN]->(language);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_actor.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film_actor:Film_Actor{act_ID: row1.actor_id})
MATCH (actor:Actor{actor_ID: row1.actor_id})
MERGE (film_actor)-[:HAS_ACTOR]->(actor);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_actor.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film_actor:Film_Actor{film_actor_ID: row1.film_id})
MATCH (film:Film{film_ID: row1.film_id})
MERGE (film_actor)-[:HAS_ACTOR]->(actor);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_text.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film_text:Film_Text{film_text_ID: row1.film_id})
MATCH (film:Film{film_ID: row1.film_id})
MERGE (film_text)-[:FROM]->(film);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_category.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film_category:Film_Category{film_category_ID: row1.category_id})
MATCH (category:Category{category_ID: row1.category_id})
MERGE (film_category)-[:HAS_BELONGS]->(category);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/film_category.csv" AS row1 FIELDTERMINATOR ';'

MATCH (film_category:Film_Category{film_category_ID: row1.film_id})
MATCH (film:Film{film_ID: row1.film_id})
MERGE (film)-[:FROM_CATEGORY]->(category);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/inventory.csv" AS row1 FIELDTERMINATOR ';'

MATCH (inventory:Inventory{inventory_ID: row1.inventory_id})
MATCH (film:Film{film_ID: row1.film_id})
MERGE (inventory)-[:HAS]->(film);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/inventory.csv" AS row1 FIELDTERMINATOR ';'

MATCH (inventory:Inventory{inventory_ID: row1.inventory_id})
MATCH (store:Store{store_ID: row1.store_id})
MERGE (inventory)-[:FROM_STORE]->(store);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/staff.csv" AS row1 FIELDTERMINATOR ';'

MATCH (staff:Staff{staff_ID: row1.staff_id})
MATCH (add:Address{address_ID: row1.address_id})
MERGE (staff)-[:IS_FROM]->(add);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/staff.csv" AS row1 FIELDTERMINATOR ';'

MATCH (staff:Staff{staff_ID: row1.staff_id})
MATCH (store:Store{store_ID: row1.store_id})
MERGE (staff)-[:WORKS]->(store);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS row1 FIELDTERMINATOR ';'

MATCH (rental:Rental{rental_ID: row1.rental_id})
MATCH (inventory:Inventory{inventory_ID: row1.inventory_id})
MERGE (rental)-[:RENTAL_FROM]->(inventory);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS row1 FIELDTERMINATOR ';'

MATCH (rental:Rental{rental_ID: row1.rental_id})
MATCH (customer:Customer{customer_ID: row1.customer_id})
MERGE (rental)-[:RENTAL_FROM]->(inventory);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/rental.csv" AS row1 FIELDTERMINATOR ';'

MATCH (rental:Rental{rental_ID: row1.rental_id})
MATCH (staff:Staff{staff_ID: row1.staff_id})
MERGE (rental)-[:STAFF_FROM]->(staff);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS row1 FIELDTERMINATOR ';'

MATCH (payment:Payment{payment_ID: row1.payment_id})
MATCH (customer:Customer{customer_ID: row1.customer_id})
MERGE (customer)-[:PAYED]->(payment);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS row1 FIELDTERMINATOR ';'

MATCH (payment:Payment{payment_ID: row1.payment_id})
MATCH (staff:Staff{staff_ID: row1.staff_id})
MERGE (payment)-[:STAFF_PAYED]->(staff);

USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///Users/saraalexandradasilvapereira/Desktop/UMinho/BDnoSQL/NoSQL_vs_SQL/Neo4j/actor/payment.csv" AS row1 FIELDTERMINATOR ';'

MATCH (payment:Payment{payment_ID: row1.payment_id})
MATCH (rental:Rental{rental_ID: row1.rental_id})
MERGE (rent)-[:COSTS]->(payment);









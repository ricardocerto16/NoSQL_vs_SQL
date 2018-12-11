import mysql
import mysql.connector as con
from mysql.connector import errorcode
from pymongo import MongoClient
from bson.decimal128 import Decimal128

# ================================================================================================================================================= #


def connectToSQL():
    try:
        connection = con.connect(user="root", database="sakila")
        print("Ligado a sakilaSQL")
        return connection
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Username ou Password errados")
            return

        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Erro na Base de Dados")
            return
        else:
            print(err)
            return


def connectToMongo():
    client = MongoClient("localhost", 27017)
    mongodb = client["sakila_mongo"]

    if "sakila_mongo" in client.list_database_names():
        print("Base de Dados Mongo já existia")
        # SE JÁ EXISTIA A BD AO EXECUTAR O SCRIPT, FAZ DROP DELA
        client.drop_database("sakila_mongo")
    return mongodb


def insertFilmsMongoDB(mysqld, mongodb):
    cursor = mysqld.cursor()
    filmsMongoDoc = getFilms(cursor)
    filmInsertResult = mongodb.filmsCollection.insert_many(filmsMongoDoc)
    print(filmInsertResult.inserted_ids)


def insertCustomersMongoDB(mysqld, mongodb):
    cursor = mysqld.cursor()
    customersMongoDoc = getCustomers(cursor)
    customerInsertResult = mongodb.customersCollection.insert_many(customersMongoDoc)
    print(customerInsertResult.inserted_ids)


def insertStoresMongoDB(mysqld, mongodb):
    cursor = mysqld.cursor()
    storesMongoDoc = getStores(cursor)
    storeInsertResult = mongodb.storesCollection.insert_many(storesMongoDoc)
    print(storeInsertResult.inserted_ids)



def getFilms(cursor):
    filmsQuery = "SELECT f.film_id, f.title, f.description, c.name AS category, f.release_year, l.name AS language, f.length, f.rating, f.rental_duration, f.rental_rate, f.replacement_cost, f.special_features " \
                 "FROM film as f " \
                 "INNER JOIN language as l ON f.language_id = l.language_id " \
                 "INNER JOIN film_category ON f.film_id = film_category.film_id " \
                 "INNER JOIN category AS c ON film_category.category_id = c.category_id " \
                 "ORDER BY f.film_id LIMIT 20"

    cursor.execute(filmsQuery)
    filmsRes = cursor.fetchall()

    filmsDocList = []
    numberFilms = 0

    for film in filmsRes:
        filmID = film[0]
        filmTitle = film[1]
        filmDescrp = film[2]
        category = film[3]
        releaseYear = film[4]
        language = film[5]
        length = film[6]
        rating = film[7]
        rentalDuration = film[8]
        rentalRate = film[9]
        replacementCost = film[10]
        specialFeatures = str(film[11])[1:-1].replace("\'", "").split(",")  # {'Deleted Scenes', 'Behind the Scenes'} -> "['Deleted Scenes', 'Behind the Scenes']"
        castDoc = getFilmCast(cursor, filmID)

        filmDoc = {"_id": filmID,
                   "title": filmTitle,
                   "description": filmDescrp,
                   "category": category,
                   "release_year": releaseYear,
                   "language": language,
                   "length": length,
                   "rating": rating,
                   "rental_duration": rentalDuration,
                   "rental_rate": Decimal128(rentalRate),
                   "replacement_cost": Decimal128(replacementCost),
                   "special_features": specialFeatures,
                   "cast": castDoc}

        numberFilms += 1
        filmsDocList.append(filmDoc)

    # [{'film_id': 1, 'title': 'ACADEMY DINOSAUR', 'description': 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies', 'category': 'Documentary', 'release_year': 2006, 'language': 'English', 'length': 86, 'rating': 'PG', 'rental_duration': 6, 'rental_rate': Decimal('0.99'), 'replacement_cost': Decimal('20.99'), 'special_features': {'Behind the Scenes', 'Deleted Scenes'}, 'cast': [{'actor_id': 1, 'actor_first_name': 'PENELOPE', 'actor_last_name': 'GUINESS'},
    print("Número de films existentes na coleção: " + str(numberFilms))
    return filmsDocList


def getFilmCast(cursor, filmID):
    castQuery = "SELECT a.actor_id, a.first_name, a.last_name " \
                "FROM actor AS a " \
                "INNER JOIN film_actor ON a.actor_id = film_actor.actor_id " \
                "INNER JOIN film as f ON film_actor.film_id = f.film_id " \
                "WHERE f.film_id = " + str(filmID)

    cursor.execute(castQuery)
    castRes = cursor.fetchall()

    castDocList = []

    for actor in castRes:
        actorID = actor[0]
        actorFirstName = actor[1]
        actorLastName = actor[2]

        actorDoc = {"_id": actorID,
                    "actor_first_name": actorFirstName,
                    "actor_last_name": actorLastName}

        castDocList.append(actorDoc)
    # [{'actor_id': 1, 'actor_first_name': 'PENELOPE', 'actor_last_name': 'GUINESS'}, {'actor_id': 10, 'actor_first_name': 'CHRISTIAN', 'actor_last_name': 'GABLE'},
    return castDocList


def getCustomers(cursor):
    customersQuery = "SELECT cs.customer_id, cs.first_name, cs.last_name, cs.email, a.address, a.phone, ct.city, cnt.country, a.district, a.postal_code " \
                     "FROM customer AS cs " \
                     "INNER JOIN address AS a ON cs.address_id = a.address_id " \
                     "INNER JOIN city AS ct ON a.city_id = ct.city_id " \
                     "INNER JOIN country AS cnt ON ct.country_id = cnt.country_id " \
                     "ORDER BY cs.store_id LIMIT 1"

    cursor.execute(customersQuery)
    customersRes = cursor.fetchall()

    customersDocList = []
    numberClients = 0

    for customer in customersRes:
        customerID = customer[0]
        customerFirstName = customer[1]
        customerLastName = customer[2]
        customerEmail = customer[3]
        customerAddress = customer[4]
        customerPhone = customer[5]
        customerCity = customer[6]
        customerCountry = customer[7]
        customerDistrict = customer[8]
        customerPostalCode = customer[9]
        rentalsDoc = getCustomerRentals(cursor, customerID)

        customerDoc = {"_id": customerID,
                       "first_name": customerFirstName,
                       "last_name": customerLastName,
                       "email": customerEmail,
                       "address": customerAddress,
                       "phone": customerPhone,
                       "city": customerCity,
                       "country": customerCountry,
                       "district": customerDistrict,
                       "postal_code": customerPostalCode,
                       "rentals_made": rentalsDoc}

        numberClients += 1
        customersDocList.append(customerDoc)

    # [{'customer_id': 247, 'first_name': 'STELLA', 'last_name': 'MORENO', 'email': 'STELLA.MORENO@sakilacustomer.org', 'address': '1473 Changhwa Parkway', 'phone': '266798132374', 'city': 'Coacalco de Berriozbal', 'country': 'Mexico', 'district': 'Mxico', 'postal_code': '75933', 'rentals_made': [{'rental_id': 189, 'inventory_id': 984, 'customer_id': 247, 'store_id': 1, 'film_title': 'DEEP CRUSADE', 'rental_date': datetime.datetime(2005, 5, 26, 6, 1, 41), 'return_date': datetime.datetime(2005, 5, 27, 6, 11, 41), 'staff_id': 1, 'payment_info': [{'payment_id': 6677, 'customer_id': 247, 'payment_date': datetime.datetime(2005, 5, 26, 6, 1, 41), 'payment_amount': Decimal('4.99')}]},
    print("Número de customers existentes na coleção: " + str(numberClients))
    return customersDocList


def getCustomerRentals(cursor, customerID):
    rentalsQuery = "SELECT r.rental_id, r.inventory_id, r.customer_id, s.store_id, f.title, r.rental_date, r.return_date, r.staff_id " \
                       "FROM rental AS r " \
                       "INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id " \
                       "INNER JOIN film AS f ON i.film_id = f.film_id " \
                       "INNER JOIN store AS s ON i.store_id = s.store_id " \
                       "WHERE r.customer_id = " + str(customerID)

    cursor.execute(rentalsQuery)
    rentalsRes = cursor.fetchall()

    rentalsDocList = []

    for rental in rentalsRes:
        rentalID = rental[0]
        inventoryID = rental[1]
        # customerID = customerID
        storeID = rental[3]
        filmTitle = rental[4]
        rentalDate = rental[5]
        returnDate = rental[6]
        staffID = rental[7]
        paymentsDoc = getRentalsPayment(cursor, rentalID)

        rentalDoc = {"_id": rentalID,
                     "inventory_id": inventoryID,
                     "customer_id": customerID,
                     "store_id": storeID,
                     "film_title": filmTitle,
                     "rental_date": rentalDate,
                     "return_date": returnDate,
                     "staff_id": staffID,
                     "payment_info": paymentsDoc}

        rentalsDocList.append(rentalDoc)

    # [{'rental_id': 189, 'inventory_id': 984, 'customer_id': 247, 'store_id': 1, 'film_title': 'DEEP CRUSADE', 'rental_date': datetime.datetime(2005, 5, 26, 6, 1, 41), 'return_date': datetime.datetime(2005, 5, 27, 6, 11, 41), 'staff_id': 1, 'payment_info': [{'payment_id': 6677, 'customer_id': 247, 'payment_date': datetime.datetime(2005, 5, 26, 6, 1, 41), 'payment_amount': Decimal('4.99')}]},
    return rentalsDocList


def getRentalsPayment(cursor, rentalID):
    paymentsQuery = "SELECT p.payment_id, p.customer_id, p.payment_date, p.amount " \
                     "FROM payment AS p " \
                     "WHERE p.rental_id = " + str(rentalID)

    cursor.execute(paymentsQuery)
    paymentsRes = cursor.fetchall()

    paymentsDocList = []

    for payment in paymentsRes:
        paymentID = payment[0]
        customerID = payment[1]
        paymentDate = payment[2]
        paymentAmount = payment[3]

        paymentDoc = {"_id": paymentID,
                      "customer_id": customerID,
                      "payment_date": paymentDate,
                      "payment_amount": Decimal128(paymentAmount)}

        paymentsDocList.append(paymentDoc)

    # [{'payment_id': 8380, 'customer_id': 308, 'payment_date': datetime.datetime(2005, 8, 23, 15, 3, 13), 'payment_amount': Decimal('2.99')}]
    return paymentsDocList


def getStores(cursor):
    storesQuery = "SELECT s.store_id, a.address, a.phone, a.postal_code, ct.city, cnt.country, a.district, s.manager_staff_id, stf.first_name AS manager_first_name, stf.last_name AS manager_last_name, (SELECT a.phone FROM address AS a WHERE a.address_id = stf.address_id) AS manager_phone " \
                  "FROM store as s " \
                  "INNER JOIN address AS a ON s.address_id = a.address_id " \
                  "INNER JOIN city AS ct ON a.city_id = ct.city_id " \
                  "INNER JOIN country AS cnt ON ct.country_id = cnt.country_id " \
                  "INNER JOIN staff AS stf ON s.manager_staff_id = stf.staff_id " \
                  "ORDER BY s.store_id LIMIT 1;"

    cursor.execute(storesQuery)
    storesRes = cursor.fetchall()

    storesDocList = []
    numberStores = 0

    for store in storesRes:
        storeID = store[0]
        storeAddress = store[1]
        storePhone = store[2]
        storePostalCode = store[3]
        storeCity = store[4]
        storeCountry = store[5]
        storeDistrict = store[6]
        managerId = store[7]
        managerFirstName = store[8]
        managerLastName = store[9]
        managerPhone = store[10]

        staffDoc = getStaff(cursor, storeID)
        inventoryDoc = getInventory(cursor, storeID)

        storeDoc = {"_id": storeID,
                    "address": storeAddress,
                    "phone": storePhone,
                    "postal_code": storePostalCode,
                    "city": storeCity,
                    "country": storeCountry,
                    "district": storeDistrict,
                    "manager_id": managerId,
                    "manager_first_name": managerFirstName,
                    "manager_last_name": managerLastName,
                    "manager_phone": managerPhone,
                    "staff": staffDoc,
                    "inventory": inventoryDoc}

        numberStores += 1
        storesDocList.append(storeDoc)
        # [{'store_id': 1, 'address': '47 MySakila Drive', 'phone': '', 'postal_code': '', 'city': 'Lethbridge', 'country': 'Canada', 'district': 'Alberta', 'manager_id': 1, 'manager_first_name': 'Mike', 'manager_last_name': 'Hillyer', 'staff': [{'staff_id': 1, 'first_name': 'Mike', 'last_name': 'Hillyer', 'address': '23 Workhaven Lane', 'email': 'Mike.Hillyer@sakilastaff.com', 'city': 'Lethbridge', 'country': 'Canada', 'district': 'Alberta', 'phone': '14033335568'}], 'inventory': [{'inventory_id': 1, 'film_id': 1, 'film_title': 'ACADEMY DINOSAUR'},
        print("Número de stores existentes na coleção: " + str(numberStores))
        return storesDocList


def getStaff(cursor, storeID):
    staffQuery = "SELECT stf.staff_id, stf.first_name, stf.last_name, a.address, stf.email, ct.city, cnt.country, a.district, a.phone as staff_phone " \
                 "FROM staff AS stf " \
                 "INNER JOIN address AS a ON stf.address_id = a.address_id " \
                 "INNER JOIN city AS ct ON a.city_id = ct.city_id " \
                 "INNER JOIN country AS cnt ON ct.country_id = cnt.country_id " \
                 "WHERE stf.store_id = " + str(storeID)

    cursor.execute(staffQuery)
    staffRes = cursor.fetchall()

    staffDocList = []

    for staff in staffRes:
        staffID = staff[0]
        staffFirstName = staff[1]
        staffLastName = staff[2]
        staffAddress = staff[3]
        staffEmail = staff[4]
        staffCity = staff[5]
        staffCountry = staff[6]
        staffDistrict = staff[7]
        staffPhone = staff[8]

        staffDoc = {"_id": staffID,
                    "first_name": staffFirstName,
                    "last_name": staffLastName,
                    "address": staffAddress,
                    "email": staffEmail,
                    "city": staffCity,
                    "country": staffCountry,
                    "district": staffDistrict,
                    "phone": staffPhone}

        staffDocList.append(staffDoc)
    # [{'staff_id': 1, 'first_name': 'Mike', 'last_name': 'Hillyer', 'address': '23 Workhaven Lane', 'email': 'Mike.Hillyer@sakilastaff.com', 'city': 'Lethbridge', 'country': 'Canada', 'district': 'Alberta', 'phone': '14033335568'}]
    return staffDocList


def getInventory(cursor, storeID):
    inventoryQuery = "SELECT i.inventory_id, i.film_id, f.title " \
                     "FROM inventory AS i " \
                     "INNER JOIN film as f ON i.film_id = f.film_id " \
                     "WHERE i.store_id = " + str(storeID)

    cursor.execute(inventoryQuery)
    inventoryRes = cursor.fetchall()

    inventoryDocList = []

    for product in inventoryRes:
        inventoryID = product[0]
        filmID = product[1]
        filmTitle = product[2]

        inventoryDoc = {"_id": inventoryID,
                        "film_id": filmID,
                        "film_title": filmTitle}

        inventoryDocList.append(inventoryDoc)

    # [{'inventory_id': 1, 'film_id': 1, 'film_title': 'ACADEMY DINOSAUR'}, {'inventory_id': 2, 'film_id': 1, 'film_title': 'ACADEMY DINOSAUR'},
    return inventoryDocList

# ================================================================================================================================================= #


def main():
    # CONECTAR BASE DE DADOS SQL
    mysqld = connectToSQL()

    # CONECTAR BASE DE DADOS MONGO
    mongodb = connectToMongo()

    # TODO TIRAR O LIMIT E VER SE É PRECISO TIRAR OS ID'S

    # ADICIONAR FILMS À COLEÇÃO EM MONGO
    insertFilmsMongoDB(mysqld, mongodb)

    # ADICIONAR CUSTOMERS À COLEÇÃO EM MONGO
    insertCustomersMongoDB(mysqld, mongodb)

    # ADICIONAR STORES À COLEÇÃO EM MONGO
    insertStoresMongoDB(mysqld, mongodb)

# Iniciar Programa
if __name__ == "__main__":
    main()


-- PIZARRO LIMPIAS CARLOS
-- N reg.: 221045473

CREATE DATABASE SoporteBD;


CREATE TABLE customer(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	date_of_birth DATE,
	"name" VARCHAR(255)
)

CREATE TABLE pieces_of_luggage(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	number INT NOT NULL,
	"weight" DECIMAL NOT NULL, 
)

CREATE TABLE airport(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	"name" VARCHAR(255) NOT NULL,
)

CREATE TABLE plane_model(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	"description" VARCHAR(255),
	graphic VARCHAR(255),
)

CREATE TABLE frequent_flyer_card (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ffc_number INT NOT NULL,
	miles INT,
	meal_code VARCHAR(10),
	id_customer INT NOT NULL,
	FOREIGN KEY(id_customer) REFERENCES customer(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)


CREATE TABLE ticket(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ticketing_code INT NOT NULL,
	number INT NOT NULL,
	id_customer INT NOT NULL,
	FOREIGN KEY (id_customer) REFERENCES customer(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

CREATE TABLE coupon(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	id_ticket INT NOT NULL,
	date_of_redemption DATE NOT NULL,
	class VARCHAR(255) NOT NULL,
	stand_by VARCHAR(255),
	meal_code VARCHAR(10),
	id_flight INT NOT NULL,
	FOREIGN KEY (id_flight) REFERENCES flight(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE

)

CREATE TABLE flight(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	boarding_time TIME NOT NULL,
	flight_date DATE NOT NULL,
	gate VARCHAR(10) NOT NULL,
	check_in_counter VARCHAR(10) NOT NULL,
	id_flight_number INT NOT NULL,
	FOREIGN KEY(id_flight_number) REFERENCES flight_number(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE

)

CREATE TABLE flight_number(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	departure_time TIME NOT NULL,
	"description" VARCHAR(255),
	"type" VARCHAR(255) NOT NULL,
	airline VARCHAR(255) NOT NULL,
	id_airport_start INT NOT NULL,
	id_airport_goal INT NOT NULL,
	id_plane_model INT,
	FOREIGN KEY(id_airport_start) REFERENCES airport(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(id_airport_goal) REFERENCES airport(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(id_plane_model) REFERENCES plane_model(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)


CREATE TABLE available_seat(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	id_coupon INT NOT NULL,
	id_flight INT NOT NULL,
	id_seat INT NOT NULL,
	FOREIGN KEY(id_coupon) REFERENCES coupon(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(id_flight) REFERENCES flight(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY(id_seat) REFERENCES seat(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)

CREATE TABLE airplane(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	registration_number VARCHAR(15) NOT NULL,
	begin_of_operation DATE NOT NULL,
	"status" VARCHAR(10),
	id_plane_model INT NOT NULL,
	FOREIGN KEY (id_plane_model) REFERENCES plane_model(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)


CREATE TABLE seat(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	size DECIMAL NOT NULL, 
	number INT NOT NULL,
	"location" VARCHAR(20),
	id_plane_model INT NOT NULL,
	FOREIGN KEY (id_plane_model) REFERENCES plane_model(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
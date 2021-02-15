CREATE DATABASE epam_db;

CREATE TABLE guides (
    id int AUTO_INCREMENT PRIMARY KEY,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    rating decimal(3,2)
); 

INSERT INTO guides (last_name, first_name, rating)
VALUES ('Rogan', 'Joe', 5.0); 
INSERT INTO guides (last_name, first_name, rating)
VALUES ('Plant', 'Robert', 4.5); 
INSERT INTO guides (last_name, first_name, rating)
VALUES ('Clark', 'Gary', 4.8),
       ('Beato', 'Rick', 4.5),
       ('Musk', 'Elon', 4.2);

CREATE TABLE guests (
    id int AUTO_INCREMENT PRIMARY KEY,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    address varchar(255),
    email varchar(255),
    phone varchar(15)
); 

INSERT INTO guests (last_name, first_name, address, email, phone)
VALUES ('Colins', 'Ann', 'Boston, Baker st. 88, ap. 14', 'anncollins@gmail.com', '+17866544565'),
       ('Colins', 'Bob', 'Boston, Baker st. 88, ap. 14', 'bobcollins@gmail.com', '+17866544567'),
       ('Colins', 'Tom', 'Boston, Baker st. 88, ap. 14', 'tomcollins@gmail.com', '+17866544566'),
       ('Colins', 'Eric', 'Boston, Baker st. 88, ap. 14', 'ericcollins@gmail.com', '+17866544564'),
       ('Green', 'Lora', 'Boston, Factory st. 15, ap. 22', 'loragreen@gmail.com', '+17865544812'),
       ('Green', 'Brandon', 'Boston, Factory st. 15, ap. 22', 'brandongreen@gmail.com', '+17865544811'),
       ('Green', 'Sybil', 'Boston, Factory st. 15, ap. 22', 'sybilgreen@gmail.com', '+17865544814'),
       ('Green', 'Tyler', 'Boston, Factory st. 15, ap. 22', 'tylergreen@gmail.com', '+17865544815'),
       ('Rogers', 'Paul', 'New York, Jeffersons st. 19', 'paulrogers@gmail.com', '+17885544878'),
       ('Rogers', 'Lisa', 'New York, Jeffersons st. 19', 'lisarogers@gmail.com', '+17885544879'),
       ('Rogers', 'Brian', 'New York, Jeffersons st. 19', 'brianogers@gmail.com', '+17885544880'),
       ('Rogers', 'Whiney', 'New York, Jeffersons st. 19', 'whitneyrogers@gmail.com', '+17885544881'),
       ('Rogers', 'April', 'New York, Jeffersons st. 19', 'aprilogers@gmail.com', '+17885544878'),
       ('Page', 'Jimmy', 'Austin, Francklin st. 35', 'jimmypage@gmail.com', '+14485544828'),
       ('Page', 'Lorean', 'Austin, Francklin st. 35', 'loreanpage@gmail.com', '+14485544827'),
       ('Page', 'Mark', 'Austin, Francklin st. 35', 'markpage@gmail.com', '+14485544858'),
       ('Page', 'Gordon', 'Austin, Francklin st. 35', 'gordonpage@gmail.com', '+14485544826');

CREATE TABLE destinations (
    id int AUTO_INCREMENT PRIMARY KEY,
    location varchar(255) NOT NULL,
    description varchar(8095),
    image_url varchar(255)
); 

INSERT INTO destinations (location, description, image_url)
VALUES ('Italy, Rome', 'Very beautiful place in Italy', 'italy_rome.jpg'),
       ('Italy, Naples', 'Very beautiful place in Naples', 'italy_naples.jpg'),
       ('Italy, Genoa', 'Very beautiful place in Genoa', 'italy_genoa.jpg'),
       ('Italy, Venice', 'Very beautiful place in Venice', 'italy_venice.jpg'),
       ('France, Paris', 'Very beautiful place in France', 'france_paris.jpg'),
       ('France, Biarritz', 'Very beautiful place in Biarritz', 'france_biarritz.jpg'),
       ('Germany, Berlin', 'Very beautiful place in Germany', 'germany_berlin.jpg'),
       ('Germany, Munich', 'Very beautiful place in Germany', 'germany_munich.jpg'),
       ('Norway, Bergen', 'Very beautiful place in Norway', 'norway_bergen.jpg'),
       ('Portugal, Sintra', 'Very beautiful place in Portugal', 'portugal_sintra.jpg'),
       ('Portugal, Madeira', 'Very beautiful place in Portugal', 'portugal_madeira .jpg'),
       ('Portugal, Porto', 'Very beautiful place in Portugal', 'portugal_porto .jpg'),
       ('Greece, Santorini', 'Very beautiful place in Greece', 'greece_santorini.jpg'),
       ('Belgium, Brussels', 'Very beautiful place in Belgium', 'belgium_brussels.jpg'),
       ('Belgium, Bruges', 'Very beautiful place in Belgium', 'belgium_bruges.jpg'),
       ('The Netherlands, Amsterdam', 'Very beautiful place in Netherlands', 'netherlands_amsterdam.jpg'),
       ('Hungary, Budapest', 'Very beautiful place in Budapest', 'hungary_budapest.jpg'),
       ('Czech Republic, Prague ', 'Very beautiful place in Czech Republic ', 'czech_prague.jpg');
       
CREATE TABLE tours (
    id int AUTO_INCREMENT PRIMARY KEY,
    tour_name varchar(255) NOT NULL,
    duration int,
    start_date DATETIME,
    end_date DATETIME,
    price decimal(6,2),
    rating decimal(4,2),
    guide_id int,
    FOREIGN KEY(guide_id) REFERENCES guides(id)
); 

INSERT INTO tours (tour_name, duration, start_date, end_date, price, rating, guide_id)
VALUES ('Around Europe', 28, '2021-06-01 10:00:00', '2021-06-29 12:00:00', 8700.00, 9.85, 1),
       ('Magic Italy', 8, '2021-07-01 10:00:00', '2021-07-09 12:00:00', 3700.00, 9.30, 2),
       ('Romantic getaway', 9, '2021-07-10 10:00:00', '2021-07-20 12:00:00', 4200.00, 9.70, 3),
       ('Gorgeous North', 12, '2021-08-02 10:00:00', '2021-08-14 12:00:00', 5400.00, 9.90, 4);

CREATE TABLE tour_destinations (
    id int AUTO_INCREMENT PRIMARY KEY,
    tour_id int,
    destination_id int,
    FOREIGN KEY(tour_id) REFERENCES tours(id),
	FOREIGN KEY(destination_id) REFERENCES destinations(id)
); 

INSERT INTO tour_destinations (tour_id, destination_id)
VALUES (1, 1),
       (1, 2),
       (1, 4),
       (1, 5),
       (1, 6),
       (1, 7),
       (1, 8),
       (1, 9),
       (1, 11),
       (1, 14),
       (1, 16),
       (1, 17),
       (1, 18),
       (2, 1),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 4),
       (3, 5),
       (3, 18),
       (3, 10),
       (3, 16),
       (4, 9),
       (4, 14),
       (4, 15),
       (4, 16),
       (4, 7),
       (4, 18);

CREATE TABLE bookings (
    id int AUTO_INCREMENT PRIMARY KEY,
    tour_id int,
    guest_id int,
	FOREIGN KEY(guest_id) REFERENCES guests(id),
	FOREIGN KEY(tour_id) REFERENCES tours(id)
); 

INSERT INTO bookings (tour_id, guest_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 5),
       (2, 6),
       (2, 7),
       (2, 8),
       (4, 9),
       (4, 10),
       (4, 11),
       (4, 12),
       (4, 13),
       (3, 14),
       (3, 15),
       (3, 16),
       (3, 17);

-- Drop tables if they exist

CREATE DATABASE IF NOT EXISTS restaurant_app;
USE restaurant_app;
-- Create regions table
CREATE TABLE regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100)
);

-- Create streets table
CREATE TABLE streets (
    street_id INT AUTO_INCREMENT PRIMARY KEY,
    street_name VARCHAR(100),
    number VARCHAR(10),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Create users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);

-- Create restaurants table
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    available_seats INT,
    street_id INT,
    FOREIGN KEY (street_id) REFERENCES streets(street_id)
);

-- Create slots table
CREATE TABLE slots (
    slot_id INT AUTO_INCREMENT PRIMARY KEY,
    time TIME
);

-- Create reservations table
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    slot_id INT,
    people_count INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (slot_id) REFERENCES slots(slot_id)
);

-- Insert sample data
INSERT INTO regions (region_name) VALUES ('Athens'), ('Thessaloniki');

INSERT INTO streets (street_name, number, region_id) VALUES
('Ermou', '24A', 1),
('Tsimiski', '12', 2);

INSERT INTO users (name, email, password) VALUES
('Anna Papadopoulou', 'anna@mail.com', '$2a$10$hashedPassword1'),
('Nikos Karavasilis', 'nikos@mail.com', '$2a$10$hashedPassword2');

INSERT INTO restaurants (name, description, available_seats, street_id) VALUES
('Taverna Plaka', 'Traditional Greek cuisine', 40, 1),
('Burger Spot', 'Gourmet burgers & beer', 30, 2);

INSERT INTO slots (time) VALUES ('12:00:00'), ('18:00:00'), ('20:00:00');

INSERT INTO reservations (user_id, restaurant_id, slot_id, people_count) VALUES
(1, 1, 2, 4),
(2, 2, 3, 2);

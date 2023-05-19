-- Create the hbnb_dev_db database
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;

-- Use the hbnb_dev_db database
USE hbnb_dev_db;

-- Create the cities table
CREATE TABLE IF NOT EXISTS cities (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    state_id INT(11) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (state_id) REFERENCES states(id)
);

-- Create the states table
CREATE TABLE IF NOT EXISTS states (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Create the places table
CREATE TABLE IF NOT EXISTS places (
    id INT(11) NOT NULL AUTO_INCREMENT,
    city_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    number_rooms INT(11) NOT NULL,
    number_bathrooms INT(11) NOT NULL,
    max_guest INT(11) NOT NULL,
    price_by_night INT(11) NOT NULL,
    latitude FLOAT,
    longitude FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES cities(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the amenities table
CREATE TABLE IF NOT EXISTS amenities (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Create the place_amenities table
CREATE TABLE IF NOT EXISTS place_amenities (
    place_id INT(11) NOT NULL,
    amenity_id INT(11) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (place_id, amenity_id),
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (amenity_id) REFERENCES amenities(id)
);
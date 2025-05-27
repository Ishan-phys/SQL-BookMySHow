-- Create table for Theatre
CREATE TABLE Theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Create table for Screen
CREATE TABLE Screen (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT NOT NULL,
    seats INT NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id) ON DELETE CASCADE
);

-- Create table for Movie
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    language VARCHAR(50),
    duration INT,  -- in minutes
    genre VARCHAR(50),
    certificate_rating VARCHAR(10)
);

-- Create table for Show
CREATE TABLE `Show` (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE,
    start_time TIME,
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE
);

-- Create table for User
CREATE TABLE `User` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE
);

-- Create table for Seat
CREATE TABLE Seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_type VARCHAR(20),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id) ON DELETE CASCADE,
    UNIQUE (screen_id, seat_number)
);

-- Create table for Booking
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('CONFIRMED', 'CANCELLED') DEFAULT 'CONFIRMED',
    FOREIGN KEY (user_id) REFERENCES `User`(user_id),
    FOREIGN KEY (show_id) REFERENCES `Show`(show_id)
);

-- Create table for BookingSeat (junction table)
CREATE TABLE BookingSeat (
    booking_id INT,
    seat_id INT,
    PRIMARY KEY (booking_id, seat_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id) ON DELETE CASCADE
);
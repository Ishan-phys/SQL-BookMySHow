# BookMyShow Movie Ticket Booking System (MySQL)

This project implements a simplified **movie ticket booking system** modeled after platforms like BookMyShow. It includes the relational database design, table creation scripts, and workflows such as booking a seat for a specific show at a given screen and theatre.

---

## 📌 Features

* Add theatres, screens, and movies
* Schedule shows on specific dates and times

---

## 🛠️ Technologies

* **Database**: MySQL (with InnoDB engine)
* **SQL Concepts**: Primary keys, foreign keys, many-to-many relationships, ENUM, normalization (up to BCNF)

---

## 🧱️ Database Schema

### 1. `Theatre`

* `theatre_id` (PK)
* `name`
* `location`

### 2. `Screen`

* `screen_id` (PK)
* `theatre_id` (FK)
* `seats`

### 3. `Movie`

* `movie_id` (PK)
* `title`, `language`, `duration`, `genre`, `certificate_rating`

### 4. `Show`

* `show_id` (PK)
* `screen_id` (FK)
* `movie_id` (FK)
* `show_date`, `start_time`


## Fetching all shows running for a movie on a given date

### 1. Find the `show_id` for a movie, screen, and date:

```sql
SELECT s.show_id
FROM `Show` s
JOIN Movie m ON s.movie_id = m.movie_id
JOIN Screen sc ON s.screen_id = sc.screen_id
JOIN Theatre t ON sc.theatre_id = t.theatre_id
WHERE m.title = 'Rambo'
  AND t.name = 'PVR Inox'
  AND s.show_date = '2025-05-24'
  AND s.start_time = '10:30:00';
```

---

## Sample Data

* **Theatres**: PVR Inox, Phoenix Marketcity, PVR Film City
* **Movies**: ZNMD, Rambo, KKHH
* **Shows**: Scheduled across 7 days, 5 screens, and multiple time slots

---

## Future Enhancements
* Add User and Seats
* Add booking system
* Payment and ticket pricing
* Seat availability API
* Movie reviews and ratings
* Admin dashboard for show management

---

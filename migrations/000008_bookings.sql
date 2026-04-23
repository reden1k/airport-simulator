CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    flight_id INT NOT NULL REFERENCES flights(id),
    user_id INT NOT NULL REFERENCES users(id),
    seat_id INT NOT NULL REFERENCES seats(id),
    UNIQUE(flight_id, seat_id)
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
)

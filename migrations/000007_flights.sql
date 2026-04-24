CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    departure_time TIMESTAMP NOT NULL,
    departure_city_id INT NOT NULL REFERENCES cities(id),
    arrival_time TIMESTAMP NOT NULL,
    arrival_city_id INT NOT NULL REFERENCES cities(id),
    airline_id INT NOT NULL REFERENCES airlines(id),
    airplane_id INT NOT NULL REFERENCES airplanes(id),
    status VARCHAR(20) NOT NULL CHECK (status IN ('scheduled', 'boarding', 'departed', 'landed', 'cancelled', 'delayed')),
    UNIQUE(airplane_id, departure_time),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
)

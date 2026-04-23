CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    country_id INT NOT NULL REFERENCES countries(id),
    city_id INT NOT NULL REFERENCES cities(id),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

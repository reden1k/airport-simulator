CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    airplane_id INT NOT NULL REFERENCES airplanes(id),
    row_number INT NOT NULL,
    column CHAR(1) NOT NULL, -- A, B, C, D
    class VARCHAR(20) NOT NULL, -- economy, business
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(airplane_id, row_number, column)
);

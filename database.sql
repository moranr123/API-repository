-- Database setup for Auth Web App
-- Run these commands in your MySQL client

CREATE DATABASE IF NOT EXISTS auth_db;
USE auth_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Optional: Insert sample data for testing
-- INSERT INTO users (name, email, password) VALUES 
-- ('John Doe', 'john@example.com', '$2a$10$example.hashed.password.here');

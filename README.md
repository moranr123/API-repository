# Auth API - Backend Server

Node.js/Express backend API for user authentication with MySQL database.

## Features

- User registration with password hashing
- User login with JWT token generation
- Secure password storage using bcrypt
- MySQL database integration
- CORS enabled for frontend communication
- RESTful API endpoints

## Prerequisites

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

## Installation

1. Install dependencies:
```bash
npm install
```

2. Set up MySQL database:
```bash
mysql -u root -p < database.sql
```

Or manually create the database:
```sql
CREATE DATABASE auth_db;
USE auth_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

3. Configure database connection in `db.js` if needed:
```javascript
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "", // Your MySQL password
    database: "auth_db"
});
```

## Running the Server

Development mode (with auto-restart):
```bash
npm run dev
```

Production mode:
```bash
npm start
```

The server will run on `http://localhost:5000`

## API Endpoints

### POST /api/auth/register
Register a new user.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "message": "User registered successfully"
}
```

### POST /api/auth/login
Login with existing credentials.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "token": "jwt.token.here",
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  }
}
```

## Dependencies

- **express**: Web framework
- **mysql2**: MySQL client
- **bcryptjs**: Password hashing
- **jsonwebtoken**: JWT token generation
- **cors**: Cross-origin resource sharing
- **dotenv**: Environment variables

## Development Dependencies

- **nodemon**: Auto-restart server on file changes

## Project Structure

```
auth-api/
├── routes/
│   └── auth.js      # Authentication routes
├── db.js            # Database connection
├── index.js         # Server entry point
├── database.sql     # Database schema
├── package.json     # Dependencies and scripts
└── README.md        # This file
```

## Environment Variables

Create a `.env` file for production:
```
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=auth_db
JWT_SECRET=your_jwt_secret
```

## Security Notes

- Passwords are hashed using bcrypt with salt rounds of 10
- JWT tokens expire in 1 hour
- Input validation should be added for production use
- Consider rate limiting for production deployment

## Testing

You can test the API using tools like Postman or curl:

```bash
# Register a new user
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"password123"}'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'
```

# OJT Placement and Monitoring System — Backend

Backend prototype for ITEC 116 Final Project. Manages OJT/internship placements, student logbook entries, and coordinator approvals for a university OJT program.

## Tech Stack
- NestJS (backend framework)
- TypeORM (ORM)
- MySQL (database)
- JWT (authentication)
- bcrypt (password hashing)

## Features
- JWT-based authentication with protected routes
- Users module (students, coordinators)
- Placements module (student OJT applications, coordinator approval workflow)
- Logbook module (hours/task tracking tied to placements)

## Running Locally

1. Clone the repository
2. Install dependencies:
   \`\`\`
   npm install
   \`\`\`
3. Create a MySQL database named `ojt_placement_db`
4. Create a `.env` file in the root with:
   \`\`\`
   DB_HOST=localhost
   DB_PORT=3306
   DB_USERNAME=root
   DB_PASSWORD=
   DB_NAME=ojt_placement_db
   JWT_SECRET=your_secret_here
   \`\`\`
5. Run the app:
   \`\`\`
   npm run start:dev
   \`\`\`
6. Server runs at `http://localhost:3000`

## API Testing
Import the Postman collection from `docs/postman-collection.json` to test all endpoints.
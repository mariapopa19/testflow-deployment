# TestFlow Deployment

This repository provides a deployment setup for the full-stack TestFlow application using Docker Compose. It integrates two separate Git repositories (managed as Git submodules):

- `testflow-backend`: ASP.NET Core backend
- `testflow-frontend`: Vite-based React frontend

In addition, it provisions a Microsoft SQL Server container for persistent data storage.

## Project Structure

```
testflow-deployment/
├── docker-compose.yml          # Docker Compose orchestration
├── .env                        # Environment configuration (not committed to Git)
├── testflow-backend/           # Git submodule (ASP.NET Core backend)
│   └── TestFlow/Dockerfile     # Dockerfile for backend service
├── testflow-frontend/          # Git submodule (React frontend)
│   └── Dockerfile              # Dockerfile for frontend service
└── README.md                   # Project documentation
```

## Setup Instructions

### 1. Clone this repository with submodules:

```bash
git clone --recurse-submodules https://github.com/your-org/testflow-deployment.git
cd testflow-deployment
```

If submodules were not initialized during clone:

```bash
git submodule update --init --recursive
```

### 2. Configure environment variables:

Create a `.env` file at the root of the repository:

```bash
cp example.env .env
```

Then open `.env` and define the following variables:

```
SQL_SA_PASSWORD=yourStrong!Passw0rd
DB_CONNECTION_STRING=Server=sqlserver,1433;Database=TestFlow;User Id=sa;Password=yourStrong!Passw0rd;Trust Server Certificate=True
```

Note: The `.env` file is included in `.gitignore` to avoid exposing credentials.

### 3. Build and run the application:

```bash
docker compose up --build
```

- The backend API will be accessible at: `http://localhost:5000`
- The frontend application will be accessible at: `http://localhost:3000`
- SQL Server will be listening on: `localhost:1433`

## Environment Variables Summary

Ensure the following environment variables are defined in `.env`:

- `SQL_SA_PASSWORD`: Password for the `sa` user in SQL Server
- `DB_CONNECTION_STRING`: Full connection string used by the backend application

## Common Docker Commands

Rebuild all containers without using cache:

```bash
docker compose build --no-cache
```

Stop and remove all containers:

```bash
docker compose down
```

Force rebuild when submodule changes are pulled (PowerShell):

```bash
$env:CACHE_BUST = [DateTimeOffset]::Now.ToUnixTimeSeconds(); docker compose up -d --build
```

Force rebuild when submodule changes are pulled (Bash/Linux):

```bash
CACHE_BUST=$(date +%s) docker compose up -d --build
```

## Additional Notes

This setup is designed primarily for local development and academic demonstration purposes. For production-grade deployments, it is recommended to:

- Use secret management mechanisms instead of plain `.env` files
- Configure secure HTTPS communication
- Integrate automated build and deployment workflows via CI/CD pipelines

Refer to the documentation within the individual submodules for implementation details and licensing.
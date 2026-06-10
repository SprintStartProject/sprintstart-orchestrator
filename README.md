# SprintStart Orchestrator

Local development orchestration for SprintStart.

## Overview

This repository provides a single entry point for running the complete SprintStart development environment.

Included services:

* Backend
* Frontend
* AI
* PostgreSQL

The services are managed through Git submodules and Docker Compose.

## Prerequisites

* Docker Desktop
* Docker Compose
* GNU Make

## Clone Repository

Clone the repository together with all submodules:

```bash
git clone --recursive https://github.com/SprintStartProject/sprintstart-orchestrator.git
```

Or initialize submodules after cloning:

```bash
git clone https://github.com/SprintStartProject/sprintstart-orchestrator.git
cd sprintstart-orchestrator
git submodule update --init --recursive
```

## Environment Setup

Create a local environment file:

```bash
cp .env.example .env
```

Adjust values if necessary.

## Start All Services

```bash
make dev
```

## Stop All Services

```bash
make stop
```

## View Logs

```bash
make logs
```

## Restart All Services

```bash
make restart
```

## Validate Docker Compose Configuration

```bash
make config
```

## Default Ports

| Service    | Port  |
| ---------- | ----- |
| Frontend   | 3000  |
| Backend    | 8080  |
| AI         | 8000  |
| PostgreSQL | 15432 |

## Smoke Tests

Backend:

```bash
curl http://localhost:8080/actuator/health
```

AI:

```bash
curl http://localhost:8000/api/v1/health
```

Frontend:

Open:

```text
http://localhost:3000
```

## Troubleshooting

### Docker daemon is not running

Verify Docker is running:

```bash
docker ps
```

### Port conflict

If a required port is already in use, stop the conflicting application or change the port mapping.

### Missing .env file

Create the environment file:

```bash
cp .env.example .env
```

### Submodules are missing

Initialize all submodules:

```bash
git submodule update --init --recursive
```

## Repository Structure

```text
sprintstart-orchestrator/
├── .env.example
├── .gitmodules
├── .gitignore
├── Makefile
├── README.md
├── sprintstart-backend/
├── sprintstart-frontend/
└── sprintstart-ai/
```
# SprintStart Orchestrator

## Overview

This repository provides a single entry point for running the complete SprintStart development environment.

Included services:

* Backend
* Frontend
* AI
* PostgreSQL

The services are managed through Git submodules and Docker Compose.

## Prerequisites

* Docker Desktop (or Docker Engine + Docker Compose)
* Git

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

## AI Configuration

### Requirements

Before starting the AI service, ensure one of the following providers is configured.

#### Ollama

1. Install Ollama.
2. Start the Ollama service.
3. Pull the required models:

```bash
ollama pull llama3.2
ollama pull nomic-embed-text
```

#### OpenAI

1. Create an OpenAI account.
2. Generate an API key.
3. Keep the API key available for the configuration step below.

### Create a `.env` File

Create a `.env` file in the project root.

Example:

```env
# Backend selection
LLM_BACKEND=ollama

# Ollama configuration
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.2
OLLAMA_EMBED_MODEL=nomic-embed-text

# OpenAI configuration
# Required only when LLM_BACKEND=openai
OPENAI_API_KEY=<your-api-key>
OPENAI_BASE_URL=https://api.openai.com/v1

# ChromaDB
CHROMA_PATH=/app/data/chroma_db
```

### Notes

* Set `LLM_BACKEND=ollama` when using a local Ollama instance.
* Set `LLM_BACKEND=openai` when using OpenAI.
* `OPENAI_API_KEY` is required only for the OpenAI backend.
* Ollama-specific variables are required only for the Ollama backend.

## Start the Application

After the initial configuration is complete:

```bash
docker compose up
```

To rebuild containers after dependency or configuration changes:

```bash
docker compose up --build
```

To run in detached mode:

```bash
docker compose up -d
```

## Stop the Application

```bash
docker compose down
```

## View Logs

All services:

```bash
docker compose logs -f
```

Single service:

```bash
docker compose logs -f backend
```

## Default Ports

| Service    | Port  |
| ---------- | ----- |
| Frontend   | 3000  |
| Backend    | 8080  |
| AI         | 8000  |
| PostgreSQL | 15432 |

## Smoke Tests

### Backend

```bash
curl http://localhost:8080/api/v1/health
```

### AI

```bash
curl http://localhost:8000/api/v1/health
```

### Frontend

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

### Submodules are missing

Initialize all submodules:

```bash
git submodule update --init --recursive
```

### Rebuild Everything

If containers become outdated:

```bash
docker compose down
docker compose up --build
```
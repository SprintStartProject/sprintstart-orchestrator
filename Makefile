.PHONY: dev down logs config

dev:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f

config:
	docker compose config
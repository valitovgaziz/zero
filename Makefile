build:
	@docker compose build

run:
	@docker compose up --build

clean:
	@docker container prune

.DEFAULT_GOAL=run
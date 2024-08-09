build:
	@docker compose build

run:
	@docker compose up --build

clean:
	@docker container prune

cleanf:
	@docker system prune -a

.DEFAULT_GOAL=run
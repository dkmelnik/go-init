up.debug:
	docker-compose up debug --build

run.debug:
	docker-compose run --rm debug bash

build.app:
	docker-compose build app

up.app:
	docker-compose up app

run.app:
	docker-compose run --rm app bash

rebuild:
	docker-compose stop app
	make build.app
	make up.app

migrate.up:
	docker-compose exec debug migrate -database "postgres://web:web@app_db:5432/local?sslmode=disable" -path migrations up

migrate.down:
	docker-compose exec debug migrate -database "postgres://web:web@app_db:5432/local?sslmode=disable" -path migrations down

migrate.create:
	docker-compose exec debug migrate create -tz Europe/Moscow -ext sql -dir ./migrations ${name}

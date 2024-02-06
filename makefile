postgres:
	docker run --name be-example-bi-post --network be-example-network -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

network:
	docker network create be-example-network

schema:
	migrate create -ext sql -dir db/migrations -seq example_schema 

createdb:
	docker exec -it be-example-bi-post createdb --username=root --owner=root be-example-bi-post

dropdb:
	docker exec -it postgres-test dropdb be-example-bi-post

migrateup:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/be-example-bi-post?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/be-example-bi-post?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run ./cmd/main.go

mock:
	mockgen -package mockdb -destination db/mock/user.go gitlab/go-prolog-api/example/db/sqlc Users

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server mock network createschema



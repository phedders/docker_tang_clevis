up:	Dockerfile docker-compose.yaml *sh
	docker-compose up -d --build
down:
	docker-compose down
keysig:
	docker-compose exec tang /usr/local/bin/jose jwk gen -i '{"alg":"ES512"}'
keyexc:
	docker-compose exec tang /usr/local/bin/jose jwk gen -i '{"alg":"ECMR"}'

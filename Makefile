COMPOSE=$(shell docker compose >/dev/null 2>&1 && echo docker compose || echo docker-compose)
DT=$(shell date +%Y%m%d-%H%M)

up:	Dockerfile docker-compose.yaml *sh .tangdata
	$(COMPOSE) up -d --build
down:
	$(COMPOSE) down
recreate re:
	docker compose up -d --force-recreate

keysig:
	@$(COMPOSE) exec tang /usr/local/bin/jose jwk gen -i '{"alg":"ES512"}'
keyexc:
	@$(COMPOSE) exec tang /usr/local/bin/jose jwk gen -i '{"alg":"ECMR"}'
keys:
	@mkdir -p db
	@make -s keysig > db/sig-$(DT).jwk
	@make -s keyexc > db/exc-$(DT).jwk
	tar zcvf db.tgz db

.tangdata: .tangdata
	touch .tangdata

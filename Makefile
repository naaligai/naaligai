.DEFAULT_GOAL := help
.ONESHELL:

# Variables
# ---------
BACKEND_PATH := backend
ENV_DIR := venv
ENV := . $(BACKEND_PATH)/$(ENV_DIR)/bin/activate
DB_USER := postgres

# FOR RUN SCRIPTS
# ---------------
.PHONY = postgres
postgres: ## create fresh db; delete if exists
	./scripts/postgres_bootstrap.sh $(DB_USER)

# FOR BACKEND SETUP
# -----------------
.PHONY = env
env: env-setup ## setup virtualenv

.PHONY = env-setup
env-setup: $(BACKEND_PATH)/requirements.txt
	test -d $(BACKEND_PATH)/$(ENV_DIR) || virtualenv $(BACKEND_PATH)/$(ENV_DIR)
	$(ENV); pip install -r $(BACKEND_PATH)/requirements.txt

.PHONY = pip-install
pip-install: ## install dependencies based on django
	$(ENV); pip install django==3.2 djangorestframework
	$(ENV); pip install djangorestframework-simplejwt
	$(ENV); pip install psycopg2
	$(ENV); pip install sphinx sphinx_rtd_theme recommonmark
	$(ENV); pip install python-decouple dj-database-url

.PHONY = pip-freeze
pip-freeze: ## freeze current pip dependencies
	$(ENV); pip freeze > $(BACKEND_PATH)/requirements.txt


# RECOMMENTED SOFTWARES FOR DEVELOPMENT
# -------------------------------------
.PHONY = recommended-freeze
recommended-freeze: ## collects recommended software packages for development
	python3 --version > $(BACKEND_PATH)/runtime.txt
	psql -V > recommended.txt
	echo "node $$(node --version)" >> recommended.txt
	echo "npm $$(npm --version)" >> recommended.txt


# FOR FRONTEND
# ------------

.PHONY = create-frontend-app
create-frontend-app: react-app modify ## create fresh react app named as naaligai

.PHONY = react-app
react-app:
	cd frontend
	npx create-react-app naaligai

.PHONY = modify
modify:
	cd frontend
	mv naaligai/* naaligai/.* .
	rm -rf naaligai

.PHONY = npm-install
npm-install: frontend/package.json ## install npm package dependencies
	cd frontend; npm install

.PHONY = clean-frontend
clean-frontend: ## clean frontend dir
	rm -rf frontend
	mkdir frontend


# LOCAL SERVER SETUP
# ------------------
.PHONY = start-b
start-b: ## starts backend development server
	$(ENV); python3 backend/manage.py runserver

.PHONY = start-f
start-f: ## starts frontend development server
	cd frontend
	npm start

# Make Help Utility
# -----------------
SPACE_COUNT = 20
.PHONY: help
help: ## show target's description
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-$(SPACE_COUNT)s\033[0m %s\n", $$1, $$2}'

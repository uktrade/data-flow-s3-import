.PHONY: help

help: # List commands and their descriptions
	@grep -E '^[a-zA-Z0-9_-]+: # .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ": # "; printf "\n\033[93;01m%-30s %-30s\033[0m\n\n", "Command", "Description"}; {split($$1,a,":"); printf "\033[96m%-30s\033[0m \033[92m%s\033[0m\n", a[1], $$2}'

fix:
	poetry run black .
	poetry run isort .
	poetry run mypy .

tox:
	poetry run tox

build-package:
	poetry build

push-pypi-test:
	poetry publish -r test-pypi

push-pypi:
	poetry publish

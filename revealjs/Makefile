.PHONY: build slides shell

build:
	@docker build --rm -t parente/revealjs .

slides:
	@cd test; docker build --rm -t parente/revealjs:test .
	@docker run -it --rm -p 8000:8000 parente/revealjs:test

shell:
	@docker run -it --rm -p 8000:8000 parente/revealjs /bin/bash
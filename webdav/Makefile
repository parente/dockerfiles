.PHONY: build shell

build:
	@docker build --rm -t parente/webdav .

container:
	@docker run -itd \
		-e PASSWORD=12345 \
		-p 443:443 \
		parente/webdav

shell:
	@docker run -it --rm \
		-e PASSWORD=12345 \
		-v `pwd`:/host \
		-p 80:80 \
		-p 443:443 \
		parente/webdav /bin/bash
VERSION=$(shell git describe --abbrev=0 --tags)
BUILD=$(shell git rev-parse --short HEAD)

BUILD_INFO := {"build":"$(BUILD)","version":"$(VERSION)"}

.PHONY: docker
docker:
	@echo '$(BUILD_INFO)' > .build-info.json
	npm i
	docker buildx build --platform linux/amd64 -t haxii/fastify:$(VERSION) .

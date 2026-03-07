#!/usr/bin/make

.PHONY: build-image doctor help images version

.DEFAULT_GOAL   := version

PROJECT_NAME    := haskell
HASKELL_VERSION := $(shell awk -F= '/^ARG HASKELL_VERSION=/{print $$2; exit}' Dockerfile)
DOCKER          ?= docker

help: ## Show this help message
	@echo Available targets:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	  | awk 'BEGIN {FS = ":.*?## "}; \
	         {printf "  %-20s %s\n", $$1, $$2}'

build-image: ## Build the Docker image
	@echo Building $(PROJECT_NAME):$(HASKELL_VERSION)
	@$(DOCKER) buildx build --load \
	  --build-arg HASKELL_VERSION=$(HASKELL_VERSION) \
	  --tag $(PROJECT_NAME):$(HASKELL_VERSION) \
	  --tag $(PROJECT_NAME):latest \
	  .

images: ## List local images for this project
	@$(DOCKER) image ls $(PROJECT_NAME)

doctor: ## Show Docker context, builder, and project images
	@echo "== Docker context =="
	@$(DOCKER) context show
	@echo
	@echo "== Docker contexts =="
	@$(DOCKER) context ls
	@echo
	@echo "== Buildx builders =="
	@$(DOCKER) buildx ls
	@echo
	@echo "== Project images =="
	@$(DOCKER) image ls $(PROJECT_NAME)

version: build-image ## Show container version
	@$(DOCKER) run --rm $(PROJECT_NAME):latest haskell --version

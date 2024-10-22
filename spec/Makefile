all:
	tsp compile .
	redocly build-docs tsp-output/@typespec/openapi3/openapi.yaml

watch:
	fswatch -or main.tsp src | while read; do \
        	make all; \
    	done;

.PHONY: watch
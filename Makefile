SHA = $(shell git rev-parse --short HEAD)
TOC=_data/docs_toc.yml
SOURCE=$(shell grep '\s\s-\s.*' $(TOC) | sed 's/  - \(.*\)/_docs\/\1.md/')
PANDOC_IMG = vbatts/pandoc:latest

# Builds the site locally so that you can preview it without having to push to Github
.PHONY: site
site:
	@echo "Building and running the site"
	@docker run -it --rm --name site -v "$(shell pwd)":/usr/src/app -p 4000:4000 starefossen/github-pages:172

# Generates a pdf version of the protocol
.PHONY: pdf
pdf: bin/glacier.pdf

################################################################################
#	Utilities
################################################################################

# Utility to generate a pdf version of the protocol
# TODO: generate the real thing, not a sample
bin/glacier.pdf: bin/sample.md dockerfiles/bin/.weasyprint
	@echo "Generating pdf"
	@mkdir -p bin
	@docker run --rm \
		-v $(shell pwd):/src \
		weasyprint \
		$< $@

# Runs a spell checker to make sure your site looks nifty without typos
.PHONY: spell-check
spell-check: dockerfiles/bin/.spellcheck
	@echo "Running spellchecker"
	@docker run --rm -t -v "$(shell pwd)":/src spellcheck

.PHONY: clean
clean:
	@echo "Cleaning temp files and artifacts"
	@rm -rf _site .sass-cache .jekyll-metadata bin

################################################################################
#	Build Docker images
################################################################################

dockerfiles/bin/.spellcheck: dockerfiles/spellcheck/Dockerfile dockerfiles/spellcheck/.spelling
	@echo "Building Docker image with spellchecker"
	@docker build -t spellcheck $(<D)
	@touch $@

dockerfiles/bin/.weasyprint: dockerfiles/weasyprint/Dockerfile dockerfiles/weasyprint/entrypoint.sh
	@echo "Building Docker image with Pandoc and WeasyPrint"
	@docker build -t weasyprint $(<D)
	@touch $@

dockerfiles/bin/.pandoc: dockerfiles/pandoc/dockerfile dockerfiles/pandoc/entrypoint.sh
	@echo "Building Docker image with Pandoc"
	@docker build -t pandoc $(<D)
	@touch $@

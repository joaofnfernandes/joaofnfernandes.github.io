# Builds the site locally so that you can preview it without having to push to Github
.PHONY: site
site:
	@echo "Building and running the site"
	@docker run -it --rm --name site -v "$(shell pwd)":/usr/src/app -p 4000:4000 starefossen/github-pages:172

# Runs a spell checker to make sure your site looks nifty without typos
.PHONY: spell-check
spell-check: dockerfiles/bin/.spellcheck
	@echo "Running spellchecker"
	@docker run --rm -t -v "$(shell pwd)":/src spellcheck

.PHONY: clean
clean:
	@echo "Cleaning temp files and artifacts"
	@rm -rf _site .sass-cache .jekyll-metadata
################################################################################
#	Build Docker images
################################################################################

dockerfiles/bin/.spellcheck: dockerfiles/spellcheck/Dockerfile dockerfiles/spellcheck/.spelling
	@echo "Building Docker image with spellchecker"
	@docker build -t spellcheck -f $< $(<D)
	@touch $@

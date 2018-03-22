# Builds the site locally so that you can preview it without having to push to Github
.PHONY: site
site:
	@docker run -it --rm --name site -v "$(shell pwd)":/usr/src/app -p 4000:4000 starefossen/github-pages:172

# Runs a spell checker to make sure your site looks nifty without typos
.PHONY: spell-check
spell-check: dockerfiles/bin/.spellcheck
	@docker run --rm -t -v "$(shell pwd)":/src spellcheck

.PHONY: clean
clean:
	@rm -rf _site .sass-cache .jekyll-metadata
################################################################################
#	Build Docker images
################################################################################

dockerfiles/bin/.spellcheck: dockerfiles/spellcheck/Dockerfile dockerfiles/spellcheck/.spelling
	@docker build -t spellcheck -f $< $(<D)
	@touch $@

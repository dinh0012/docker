$(COMPOSER):
	mkdir -p $(BIN_DIR)
	curl -sS https://getcomposer.org/installer | \
		php -- --install-dir=$(BIN_DIR)

$(COMPOSER_COMMANDS) $(INIT_COMMAND): $(COMPOSER_LAST_UPDATE)

$(COMPOSER_LOCK): $(COMPOSER_JSON)
	rm -f $@
	$(COMPOSER) config
	$(COMPOSER) update
	touch $@

$(COMPOSER_LAST_UPDATE): $(COMPOSER) $(COMPOSER_LOCK)
	$(COMPOSER) config
	$(COMPOSER) install
	touch $@

.PHONY: composer-install
composer-install: $(COMPOSER_LAST_UPDATE)

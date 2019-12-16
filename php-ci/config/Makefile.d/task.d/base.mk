.PHONY: build
build: $(BUILD_TARGETS)

.PHONY: check
check: $(CHECK_TARGETS)

.PHONY: clean
clean: $(CLEAN_TARGETS)

.PHONY: distclean
distclean: $(DISTCLEAN_TARGETS)

.PHONY: initialize
initialize: $(INITIALIZE_TARGETS)

.PHONY: install
install: $(INSTALL_TARGETS)

.PHONY: last-build
last-build: $(LAST_BUILD_TARGETS)

.PHONY: test
test: $(TEST_TARGETS)

.PHONY: update
update:
	rm $(COMPOSER_LOCK)
	make

.PHONY: initialize-app
initialize-app:
	$(INIT_COMMAND)

.PHONY: remove-var-dir
remove-var-dir:
	rm -rf $(VAR_DIR)/*

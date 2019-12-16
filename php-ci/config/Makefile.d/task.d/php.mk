.PHONY: php-check
php-check: php-check-syntax php-lint php-check-code php-check-duplicate

.PHONY: php-check-code
php-check-code: $(CI)
	$< $(PROJECT_DIR) php_check_code

.PHONY: php-check-syntax
php-check-syntax: $(CI)
	$< $(PROJECT_DIR) php_check_syntax

.PHONY: php-generate-doc
php-generate-doc: $(CI)
	$< $(PROJECT_DIR) php_generate_doc

.PHONY: php-lint
php-lint: $(CI)
	$< $(PROJECT_DIR) php_lint

.PHONY: php-test
php-test: $(CI)
	$< $(PROJECT_DIR) php_test

.PHONY: php-check-duplicate
php-check-duplicate: $(CI)
	$< $(PROJECT_DIR) php_check_duplicate

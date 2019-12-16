ifneq (,$(wildcard $(GCI_BIN_DIR)/initialize.sh))
	INIT_COMMAND = $(GCI_BIN_DIR)/initialize.sh
else
	INIT_COMMAND =
endif

APP_CI_GITATTRIBUTES = $(PROJ_TOP_DIR)/.gitattributes
APP_PROJECT_GITATTRIBUTES = $(PROJECT_DIR)/.gitattributes
APP_CI_GITIGNORE = $(PROJ_TOP_DIR)/.gitignore
APP_PROJECT_GITIGNORE = $(PROJECT_DIR)/.gitignore

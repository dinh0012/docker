
#$(GIT_PROJECT_REPO):
#	git init
#	ln -s $(GIT_TEMPLATE_INIT_FILE) $(GIT_HOOKS_INIT_FILE)
#	ln -s $(GIT_TEMPLATE_PRE_COMMIT) $(GIT_HOOKS_PRE_COMMIT)
#	git add -A
#	git commit -m "init"
#
#.PHONY: git-initialize
#git-initialize: $(GIT_PROJECT_REPO)

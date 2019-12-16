function git_hook_pre_commit_php_lint()
{
    git_commited_files | \
        grep '\.php$' | \
        grep -v '^.phalcon/' | \
        grep -v '^bin/' | \
        xargs $XARGS_NO_RUN $GCI_BIN_DIR/ci $TOP_DIR php_lint
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

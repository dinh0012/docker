function git_hook_pre_commit_php_check_code()
{
    git_commited_files | \
        grep '\.php$' | \
        grep -v '^.phalcon/' | \
        grep -v '^bin/' | \
        grep -v '^test/' | \
        xargs $XARGS_NO_RUN $GCI_BIN_DIR/ci $TOP_DIR php_check_code
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

function git_hook_pre_commit_php_check_syntax()
{
    git_commited_files | \
        grep '\.php$' | \
        xargs $XARGS_NO_RUN $GCI_BIN_DIR/ci $TOP_DIR php_check_syntax
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

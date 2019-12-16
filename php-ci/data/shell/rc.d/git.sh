for hook_script in $PROJ_TOP_DIR/data/shell/git_hook.d/*.sh; do
    source $hook_script
done

function git_commited_files()
{
    git diff --cached --name-only --diff-filter=ACMR
}

function git_hook()
{
    declare -F | grep git_hook_$1 | awk '{print $3}' | while read func; do
        $func
        if [ $? -ne 0 ]; then
            exit 1
        fi
    done
}

function git_hook_register()
{
    init_sh=$TOP_DIR/.git/hooks/.init.sh
    if [ ! -f $init_sh ]; then
        ln -s $PROJ_TOP_DIR/.git_template/hooks/.init.sh $init_sh
    fi

    (
        cd $PROJ_TOP_DIR/.git_template/hooks
        for task in *; do
            hook_script=$TOP_DIR/.git/hooks/$task
            if [ ! -f $hook_script ]; then
                ln -s $PROJ_TOP_DIR/.git_template/hooks/$task $hook_script
            fi
        done
    )
}

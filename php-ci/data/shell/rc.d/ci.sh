for task_script in $PROJ_TOP_DIR/data/shell/task.d/*.sh; do
    source $task_script
done

function ci_task()
{
    TOP_DIR=$1
	BIN_DIR=$TOP_DIR/bin
    CONFIG_DIR=$TOP_DIR/config
    DATA_DIR=$TOP_DIR/data
    LIB_DIR=$TOP_DIR/src
    TEST_DIR=$TOP_DIR/tests
    VAR_DIR=$TOP_DIR/vendor
    COMPOSER_DIR=$TOP_DIR/vendor
    shift

    TASK=$1
    shift

    ci_task_$TASK $*
}

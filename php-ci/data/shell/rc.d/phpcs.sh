PHPCS=$GCI_BIN_DIR/phpcs
PHPCS_OPTS="-s --standard=${DATA_DIR}/php/phpcs/Dinhnv --ignore=.*/data/.*,.phalcon"

function phpcs_check_code()
{
    $PHPCS --config-set show_progress 1
    if [ -z "$*" ]; then
        find $TOP_DIR -type f ! -path "$VAR_DIR/*" ! -path "$TEST_DIR/*" -name '*.php' | \
            xargs $PHPCS $PHPCS_OPTS
    else
        $PHPCS $PHPCS_OPTS $*
    fi
}

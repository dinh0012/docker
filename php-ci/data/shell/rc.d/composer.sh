COMPOSER_BIN_DIR=$VAR_DIR/../bin

function composer_exec()
{
    #COMPOSER=$COMPOSER_BIN_DIR/composer.phar

    #if [ ! -x $COMPOSER ]; then
    #    composer_install
    #fi

    composer --working-dir=$TOP_DIR $*
}

function composer_initialize()
{
    composer_exec install --no-interaction
}

function composer_install()
{
    return
    xmkdir $COMPOSER_BIN_DIR

    http_client https://getcomposer.org/installer | \
        php -- --install-dir=$COMPOSER_BIN_DIR
}

PHPMD=$GCI_BIN_DIR/phpmd
PHPMD_FORMAT=text
PHPMD_RULE=$GCI_DATA_DIR/php/phpmd/ruleset.xml

function phpmd_check_code()
{
    if [ -z "$*" ]; then
        $PHPMD $TOP_DIR --exclude $TOP_DIR/.phalcon,$DATA_DIR,$TEST_DIR,$VAR_DIR $PHPMD_FORMAT $PHPMD_RULE
    else
        for file_or_dir in $*; do
            $PHPMD $file_or_dir $PHPMD_FORMAT $PHPMD_RULE
        done
    fi
}

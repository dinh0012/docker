function phpdoc_generate()
{
    target_dir=$VAR_DIR/docs/php
    rm -rf $target_dir
    $GCI_BIN_DIR/phpdoc run -d $LIB_DIR -t $target_dir -e php
    rm -rf /tmp/phpdoc-twig-cache
}

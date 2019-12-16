function php_check_syntax()
{
    if [ -z "$*" ]; then
        find $TOP_DIR -type f ! -path "$VAR_DIR/*"  -name '*.php' | \
            xargs -n 1 php -l > /dev/null
    else
        echo $* | xargs -n 1 php -l > /dev/null
    fi
}

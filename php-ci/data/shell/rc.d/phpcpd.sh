PHPCPD=$GCI_BIN_DIR/phpcpd
source $GCI_DATA_DIR/php/phpcpd/options.sh

function phpcpd_check_duplicate()
{
    if [ -z "$*" ]; then
        $PHPCPD \
            --exclude tests \
            --exclude vendor \
            $PHPCPD_OPTS $TOP_DIR
	else
        $PHPCPD $PHPCPD_OPTS $*
    fi
}

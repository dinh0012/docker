TOP_DIR=$(cd $(dirname $0)/..;pwd)
PROJ_TOP_DIR=$TOP_DIR
if [ -L $0 ]; then
    PROJ_TOP_DIR=$(
        script_path=$(readlink $0)
        cd $(dirname $0)
        cd $(dirname $script_path)/..
        pwd
    )
fi
source $PROJ_TOP_DIR/.init.sh
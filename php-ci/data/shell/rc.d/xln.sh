function xln()
{
    if [ -d $1 ]; then
        if [ ! -d $2 ]; then
            ln -s $1 $2
        fi
    fi
}

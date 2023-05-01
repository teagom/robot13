source settings.sh

if [ $CMD_DIS == 1 ]
    then
        echo "  CMD        : $CMD"
fi
if [ $CMD_RUN == 1 ]
    then
        echo "  Run        : $CMD "
        eval "$CMD"
fi

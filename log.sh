#!/bin/bash

# O objetivo desse script é executar outros scripts de backup em serie.

# $DESTINATION e $FORMAT via paramentro via linha de comando
if [ ! -z "$1" ]
    then
          DESTINATION="$1"
    else
          echo "!Erro: Caminho de destino é obrigatorio. '\$DESTINATION'"
          exit 0
    fi

if [ ! -z "$2" ]
    then
          SECTION="$2"
    else
          echo "!Erro: Sessao é obrigatorio. '\$SECTION'"
          exit 0
    fi

LOGFORMAT="$(date +%F_%Hh%M)" # 2022-12-30_16h20
LOGFILE="$LOGFORMAT"
LOGDIR="$DESTINATION/log/$SECTION"
LOGSUC="$LOGDIR/$LOGFILE.log"
LOGERR="$LOGDIR/$LOGFILE.err"

echo
echo "  + Log"
echo "  Log Success: $LOGSUC"
echo "  Log Error  : $LOGERR"

CMD="mkdir -p $LOGDIR"
source cmd.sh

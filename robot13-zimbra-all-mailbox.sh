#!/bin/bash

# O objetivo desse script é fazer o backup de cada mailbox seperado do Zimbra Mail.
# https://zimbra.com

# : : : : : : : : : : : : : : : : : : : : : :
# environment variables
SECTION='zimbra-mailbox'

# your domain
DOMAIN="https://mail.domain.com:8443"

# full path to zimbra binary
ZMBOX=/opt/zimbra/bin/zmmailbox

# compress
EXT='zip'
COMP="/usr/bin/zip -9r"
COMP_TEST="/usr/bin/zip -T"
COMP_SIZE="/usr/bin/du -sch"


# : : : : : : : : : : : : : : : : : : : : : :
# main code

# $DESTINATION and $FORMAT from command line
if [ ! -z "$1" ]
    then
          DESTINATION="$1"
    else
          echo "!Erro: Caminho de destino é obrigatorio. '\$BACKUP'"
          exit 0
    fi

if [ ! -z "$2" ]
    then
          FORMAT="$2"
    else
          echo "!Erro: Formato é obrigatorio. '\$FORMAT'"
          exit 0
    fi

# BACKUP : /tmp/robot13/backup/2022-12-31_16h20/zimbra-mailbox
BACKUP="$1/$2/$SECTION"
mkdir -p $BACKUP

source header.sh

# to test one mailbox
#for MBOX in "username@domain.com"

# list all mailbox
for MBOX in $(/opt/zimbra/bin/zmprov -l gaa)
 do
   echo
   echo "+ Mailbox : $MBOX"
   echo "  File    : $BACKUP/$MBOX.zip"

   # compress
   CMD="$ZMBOX -z -m $MBOX getRestURL -u $DOMAIN "//?fmt=zip" > $BACKUP/$MBOX.$EXT"
   echo "  Compress: $CMD"
   eval $CMD

   # compress test
   echo
   CMD="$COMP_TEST $BACKUP/$MBOX.$EXT"
   echo "      Test: $CMD"
   eval $CMD

   # compress size
   echo
   CMD="$COMP_SIZE $BACKUP/$MBOX.$EXT"
   echo "      Size: $CMD"
   eval $CMD
done

# resume
source resume.sh

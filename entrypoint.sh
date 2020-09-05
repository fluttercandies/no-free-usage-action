#!/bin/sh

sh -c "pub get"
sh -c "dart bin/main.dart $1 $2 -t $3 -p $4 --words='$5'"
exit 0
#!/bin/sh

# Enter the action's path to make sure we run below codes from action.
cd /github/action_files/ || exit

sh -c "pub get"
sh -c "dart bin/main.dart $1 $2 -t $3 -p $4 --words='$5'"
exit 0
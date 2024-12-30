#!/usr/bin/env bash

# "nvim session strategy"
#
# Same as vim strategy, see file 'vim_session.sh'

ORIGINAL_COMMAND="$1"
SESSION_LOCATION="/home/ahteshamul/.local/state/nvim/sessions"
TEST_DIRECTORY=`echo $2 | sed 's/\//%/g'`
LAUNCH_DIRECTORY=`echo $2 | sed 's/\//\\\%/g'`

original_command_contains_session_flag() {
	[[ "$ORIGINAL_COMMAND" =~ "-S" ]]
}

main() {
	if [ -f "${SESSION_LOCATION}/${TEST_DIRECTORY}.vim" ]; then
		echo "nvim -S \"${SESSION_LOCATION}/${LAUNCH_DIRECTORY}.vim\""
	elif [ -f "${SESSION_LOCATION}/${TEST_DIRECTORY}%%nvim-restore.vim" ]; then
    echo "nvim -S \"${SESSION_LOCATION}/${LAUNCH_DIRECTORY}\%\%nvim-restore.vim\""
	elif original_command_contains_session_flag; then
		# Session file does not exist, yet the original nvim command contains
		# session flag `-S`. This will cause an error, so we're falling back to
		# starting plain nvim.
		echo "nvim"
	else
		echo "$ORIGINAL_COMMAND" 
	fi
}
main

#!/usr/bin/env bash

# "nvim session strategy"
#
# Same as vim strategy, see file 'vim_session.sh'

ORIGINAL_COMMAND="$1"
SESSION_LOCATION="~/.local/state/nvim/sessions"
SESSION_NAME=`echo $2 | sed 's/\//%/g'`
TEST_FILE_LOCATION="${SESSION_LOCATION}/${SESSION_NAME}.vim"
ORIGINAL_FILE_LOCATION=`echo ${TEST_FILE_LOCATION} | sed 's/\%/\\\%/g'`

original_command_contains_session_flag() {
	[[ "$ORIGINAL_COMMAND" =~ "-S" ]]
}

main() {
	if [ ! -e "${TEST_FILE_LOCATION}" ]; then
		echo "nvim -S \"${ORIGINAL_FILE_LOCATION}\""
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

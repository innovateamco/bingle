#!/bin/bash

# Bash Version 3 required (it also works with ksh)
[[ ${BASH_VERSINFO[0]} -lt 3 ]] && exit 1

# Defaults
PARAM_1=false
PARAM_2=""

# Put all arguments in a new array (because BASH_ARGV is read only)
ARGS=("$@")

usage() {
  echo "Usage: $0 [-p1|--param1] [-p2|--param2 value] | [-h|--help]"
}

unknown() {
  echo "Unknown arguments:"
  for i in "${!ARGS[@]}"; do
    echo "$i: ${ARGS[i]}"
    usage
    exit 1
  done
}

for i in "${!ARGS[@]}"; do
  case "${ARGS[i]}" in
  '')
    # Skip if element is empty (happens when it's unsetted before)
    continue
    ;;
  -p1 | --param1)
    PARAM_1=true
    ;;
  -p2 | --param2)
    # Use +1 to access next array element and unset it
    PARAM_2="${ARGS[i + 1]}"
    unset 'ARGS[i+1]'
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  --)
    # End of arguments
    unset 'ARGS[i]'
    break
    ;;
  *)
    unknown
    ;;
  esac
  unset 'ARGS[i]'
done

echo PARAM_1 $PARAM_1
echo PARAM_2 $PARAM_2

exit 0

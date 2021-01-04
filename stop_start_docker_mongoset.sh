#!/bin/bash

#!/bin/bash

# Bash Version 3 required (it also works with ksh)
[[ ${BASH_VERSINFO[0]} -lt 3 ]] && exit 1

# Defaults
NUM_OF_REPLICAS=1

# Put all arguments in a new array (because BASH_ARGV is read only)
ARGS=("$@")

usage() {
  echo "Usage: $0 [-n|--num-of-replicas value] | [-h|--help]"
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
  -n | --num-of-replicas)
    # Use +1 to access next array element and unset it
    NUM_OF_REPLICAS="${ARGS[i + 1]}"
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

echo NUM_OF_REPLICAS $NUM_OF_REPLICAS

for ((i = 1; i <= $NUM_OF_REPLICAS; i++)); do
  echo "Stop/Starting mongoset$i"
  docker stop mongoset$i
  docker start mongoset$i
done

exit 0

#!/usr/bin/env bash

usage() {
  echo 'Usage: '"./$(basename $0)"'

Initializes newly templated project:
  - replaces {function-name} with the project name
'
  exit
}

# show help
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  usage
fi

set -o errexit  # exit script when a command fails
set -o nounset  # fail when accessing an unset variable
set -o pipefail  # treats pipeline command as failed when one command in the pipeline fails 
set -o xtrace  # prints every command before execution

# make sure to run from project root
cd $(dirname $0)/..


main() {
  # get the current folder name
  project_name=$(basename $(pwd))

  # skip when the project was not templated
  if [[ "$project_name" = 'api-starter' ]]; then
    echo 'Project was not templated (current folder name: '"$project_name"')'  >&2
    exit 1
  fi

  # substitute '{function-name}' with the project name
  sed -i '' 's/{function-name}/'"$project_name"'/g' .env index.js
}

main "$@"

#!/bin/sh
##############################################################################

ORG=itisopen
PREFIX=oip-init
TAG=latest

# Logging function
_log() {
  echo $*
}

# Show how to use this container
usage() {
  cat <<- EOT
  usage: run one of the following

    To display this help message:
    $ docker run -rm -v $(pwd):/data ${ORG}/${PREFIX}:${TAG} {help}

    To generate OCP templates using embedded sources, storing them
    in your current directory's work folder
    $ docker run -rm -v $(pwd)/work:/data/work ${ORG}/${PREFIX}:${TAG} generate

    To generate OCP templates from your current sources directory, storing them
    in your current directory's work folder
    $ docker run -rm -v $(pwd):/data ${ORG}/${PREFIX}:${TAG} generate

	EOT
  exit 1
}


# Copy sample platform files
copy_files() {
  _log copying files
}


# Generate files from mounted source directory
run_playbook() {
  PLAYBOOK=$1
  cd ansible
  _log echo "Running ansible playbook '$PLAYBOOK' from dir '$PWD'"
  ansible-playbook -i inventory $PLAYBOOK $*
}


# Main logic
[ $# == 0 ] && usage

# Execute requested action
case $1 in
  copy)
    shift;
    copy_files
    ;;
  generate)
    shift;
    run_playbook generate.yml $*
    ;;
  help)
    usage
    ;;
  *)
    usage
    ;;
esac

exit 0

#!/bin/bash
set -e

LABEL="devcontainer"

function usage {
    echo "mount-gd <mount point>"
}

if test -z "${1}" ; then
    usage
    exit 1
fi

if test -n "${GDFUSE_CONFIG}"  && test -n "${GDFUSE_CONFIG}" ; then
    test ! -d "${HOME}/.gdfuse/${LABEL}" && mkdir -p "${HOME}/.gdfuse/${LABEL}"
    echo "${GDFUSE_CONFIG}" > "${HOME}/.gdfuse/${LABEL}/config"
    echo "${GDFUSE_STATE}" > "${HOME}/.gdfuse/${LABEL}/state"
    google-drive-ocamlfuse -label "${LABEL}" "${1}"
fi
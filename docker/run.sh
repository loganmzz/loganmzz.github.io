#!/usr/bin/bash

SCRIPT_FILE=$(which "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")
SOURCE_DIR=$(cd "$SCRIPT_DIR"/..; pwd)

. "${SCRIPT_DIR}/env.rc"
cd "$SCRIPT_DIR"

if [ -f "${CID_FILE}" ]; then
  docker rm --force $(cat "${CID_FILE}")
  rm -rf "${CID_FILE}"
fi
docker run \
  --cidfile   "${CID_FILE}"                  \
  --name      ${CONTAINER_NAME}              \
  --publish   4000:4000                      \
  --volume   "/${SOURCE_DIR}:/var/jekyll/src" \
  --rm                                       \
  ${IMAGE_TAG}

#!/bin/bash
set -e
CIRCLECI_CACHE_DIR="${HOME}/bin"
PACKER_VERSION="1.1.2"
PACKER_CHECKSUM="7e315a6110333d9d4269ac2ec5c68e663d82a4575d3e853996a976875612724b"
PACKER_URL="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"

if [ ! -f "${CIRCLECI_CACHE_DIR}/packer" ] || [[ ! "$(packer version)" =~ "Packer v${PACKER_VERSION}" ]]; then
  wget -O /tmp/packer.zip "${PACKER_URL}"
  echo "${PACKER_CHECKSUM} /tmp/packer.zip" | sha256sum --check -
  unzip -oud "${CIRCLECI_CACHE_DIR}" /tmp/packer.zip
fi

packer version

#!/bin/bash
#
# install backends and storage
#

CURL="curl -L --retry 15 --retry-delay 2" # retry for up to 30 seconds

function fetch_golink_dist() {
    local location="$1"
    local version="$2"
    echo "golink backend installed"
    local dist="golink"
    
    local dist_url="https://github.com/opengovsg/GoGovSG/archive/refs/tags/${version}.tar.gz"
    # local dist_url="https://github.com/golinkio/golink/releases/download/v${version}/golink${version}_php8.1_dist.zip"
    echo "${dist_url}"
    if [ -f "${CACHE_DIR}/dist/${dist}" ]; then
        echo "File is already downloaded"
    else
        ${CURL} -o "${CACHE_DIR}/dist/${dist}" "${dist_url}"
    fi
    tar xzf "$CACHE_DIR/dist/${dist}" -C "$location"
    # unzip "$CACHE_DIR/dist/${dist}" -d "$location"
    rm -rf "$CACHE_DIR/dist/${dist}"
}

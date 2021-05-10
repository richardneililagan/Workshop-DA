#!/bin/bash

BASEDIR=$(dirname $0)

pushd ${BASEDIR}/../workshop/
hugo serve
popd

#!/bin/bash

set -e

WORKING_DIR=$(cd `dirname $0`/.. && pwd)

cd $WORKING_DIR

git clean -ffdx -e .idea -e .python-version


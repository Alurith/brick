#!/bin/bash
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
    # For instance, will be example_kaggle_key
else
    echo "Error: No .env found."
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo apt install mono-complete zlibc zlib1g zlib1g-dev -y

mkdir ${PROJECT_PATH} ${PROJECT_PATH}/${CODE_DIR} ${PROJECT_PATH}/${DATA_DIR}

TRIGGERVAR='$BRANCH:$PROJECT_PATH:$CODE_DIR'
envsubst "$TRIGGERVAR" < post-receive.tpl > post-receive
chmod +x post-receive

cd ${PROJECT_PATH}
git init --bare ${PROJECT_PATH}/project.git
mv ${DIR}/post-receive ${PROJECT_PATH}/project.git/hooks

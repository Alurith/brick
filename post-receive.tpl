#!/bin/bash
# post-recieve script will check $BRANCH and deploy when see an update.

while read oldrev newrev ref
do
	if [ "$ref" = "refs/heads/${BRANCH}" ];
	then
		echo "Ref $ref received. Deploying ${BRANCH} branch to production..."
		git --work-tree=${PROJECT_PATH}/${CODE_DIR} --git-dir=${PROJECT_PATH}/project.git checkout -f ${BRANCH}
		for pid in $(ps -ef | awk '/ServUO/ {print $2}'); do kill -9 $pid; done # kill al the istances of servuo
		cd ${PROJECT_PATH}/${CODE_DIR}
		make build
		${PROJECT_PATH}/${CODE_DIR}/ServUO.sh </dev/null &>/dev/null &
	fi
done

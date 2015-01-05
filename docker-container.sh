#!/bin/sh
USER=typista
__HOSTNAME__=`echo $__FQDN__ | sed -r "s/\./_/g"`
FULLPATH=$(cd `dirname $0`; pwd)/`basename $0`
DIR=`dirname $FULLPATH`
REPO=`basename $DIR`
REPO=`echo $REPO | sed -r "s/docker\-//g"`
__FQDN__=$REPO
IMAGE=$USER/$REPO
if [ "$1" != "" ];then
   	IMAGE=$IMAGE:$1
else
	VERSION=`docker images | grep "$IMAGE " | sort | tail -1 | awk '{print $2}'`
	if [ "$VERSION" != "" ];then
		IMAGE=$IMAGE:$VERSION
	fi
fi
#docker run -d --name="mysql-data" typista/docker:mysql-data
docker run -d --privileged --restart=always --name="$__FQDN__" --hostname="$__HOSTNAME__" \
	$IMAGE

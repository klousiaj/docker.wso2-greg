#!/bin/bash
set -e

# if we start with options, not sure what they would be, make sure we start the server
if [ "${1:0:1}" = '-' ]; then
	set -- ./wso2server.sh "$@"
fi

# make sure that we are starting the GREG server.
if [ "$1" = "./wso2server.sh" ]; then
  if [ -z "$DOCKER_HOST_IP" ]; then
    echo >&2 'error: unable to start WSO2 GREG '
    echo >&2 '  You need to specify DOCKER_HOST_IP'
    exit 1
  fi
  
  # if the environment variable isn't set the port offset will default to 0
  if [ -z "$WSO2_PORT_OFFSET" ]; then
    export WSO2_PORT_OFFSET=0
  fi
  
  # put the port offset parameter on the command line
  set -- "$@" -DportOffset=$WSO2_PORT_OFFSET

  export WSO2_HTTPS_PORT=$((9443 + $WSO2_PORT_OFFSET));
  # don't use this anywhere, may not need it.
  export WSO2_HTTP_PORT=$((9763 + $WSO2_PORT_OFFSET));

  echo >&2 'using '$DOCKER_HOST_IP':'$WSO2_HTTPS_PORT' to update carbon.xml and sso-idp-config.xml'

  # update the sso-idp-config.xml
  sed -i "s/localhost/$DOCKER_HOST_IP/g" /opt/$WSO2_FOLDER_NAME/repository/conf/identity/sso-idp-config.xml
  sed -i "s/9443/$WSO2_HTTPS_PORT/g" /opt/$WSO2_FOLDER_NAME/repository/conf/identity/sso-idp-config.xml

  # update the carbon.xml to reference the appropriate host IP
  sed -i "s/<!--HostName>www.wso2.org<\/HostName-->/<HostName>$DOCKER_HOST_IP<\/HostName>/g" /opt/$WSO2_FOLDER_NAME/repository/conf/carbon.xml
fi

# just execute what was provided
exec "$@"
## Supported Tags and Dockerfile Links
- latest, 5.2.0 [Dockerfile](https://github.com/klousiaj/docker.wso2-greg/blob/5.2.0/Dockerfile) 
- 5.1.0 [Dockerfile](https://github.com/klousiaj/docker.wso2-greg/blob/5.1.0/Dockerfile)

## WSO2 Governance Registry
This image includes an instance of the WSO2 Governance Registry (GREG) and is built on the [klousiaj/oracle-java](https://hub.docker.com/r/klousiaj/oracle-java/) image. The application is installed to /opt/`<WSO2_FOLDER_NAME>` and requires the `DOCKER_HOST_IP` environment variable to be set. 

## What ports are exposed?
- 9444 - HTTPS servlet transport
- 9764 - HTTP servlet transport

## Environment variables
### Inherited
- `JAVA_VERSION_MAJOR` (7)
- `JAVA_VERSION_MINOR` (79)
- `JAVA_VERSION_BUILD` (15)
- `JAVA_PACKAGE` (jdk)
- `JAVA_HOME` (/opt/java)

### Fixed 
- `WSO2_BUNDLE_NAME` *(wso2greg-5.2.0)* - property used to find the appropriate archive to download. Also used to establish directory structure within the image.
- `WSO2_FOLDER_NAME` *(wso2greg)* - property used to find the appropriate archive to download. Also used to establish directory structure within the image.

### Configurable
- `WSO2_HTTPS_PORT` *(9444)* - used to expose the appropriate port for accessing the GREG on the container. (update with `WSO2_PORT_OFFSET`)
- `WSO2_HTTP_PORT` *(9764)* - used to expose the appropriate port for accessing the GREG on the container. (update with `WSO2_PORT_OFFSET`)
- `WSO2_PORT_OFFSET` *(1)* - used to set the `portOffset` for starting the GREG on different ports.
- `DOCKER_HOST_IP` - used to update the configuration files to allow for the application to run on the container. Required to start a container based on this image. No default is specified.

## VOLUMES
No volumes have been specified for this image.

## Usage
TBD
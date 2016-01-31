##
# borrowed liberally from chilcano/wso2am
##

FROM klousiaj/oracle-java:7.79
MAINTAINER J.P. Klousia <klousiaj>

ENV WSO2_BUNDLE_NAME wso2greg-5.1.0
ENV WSO2_FOLDER_NAME wso2greg

# expose the necessary ports to run the Governance Registry
EXPOSE 9444 9764

# move the file onto the container so it can be unzipped
RUN wget -q --no-check-certificate -P /opt https://www.dropbox.com/s/tgb9q7ic4fxuabk/wso2greg-5.1.0.zip; \
  unzip /opt/$WSO2_BUNDLE_NAME.zip -d /opt/ > /opt/${WSO2_FOLDER_NAME}.listfiles; \
  mv /opt/${WSO2_BUNDLE_NAME} /opt/${WSO2_FOLDER_NAME}; \
  rm /opt/${WSO2_FOLDER_NAME}.listfiles; \
  rm /opt/${WSO2_BUNDLE_NAME}.zip;

# remove curl/unzip/wget since we don't need them.
ENV JAVA_HOME /opt/java

# Working Directory in Container
WORKDIR /opt/${WSO2_FOLDER_NAME}/bin/

# Start WSO2-GREG
CMD sh ./wso2server.sh -DportOffset=1
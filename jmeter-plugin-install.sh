#!/bin/sh
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar --output /opt/apache/apache-jmeter-${JMETER_VERSION}/cmdrunner-2.2.jar
echo "Downloaded CMDRunner"
curl -L https://jmeter-plugins.org/get/ --output /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar
echo "Downloaded Plugin Manager"

java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
echo "Java Step"
echo $(pwd)
ls

chmod a+x ${JMETER_HOME}/bin/*.sh

/opt/apache/apache-jmeter-${JMETER_VERSION}/bin/PluginManagerCMDInstaller.sh install \
blazemeter-debugger=0.6

/opt/apache/apache-jmeter-${JMETER_VERSION}/bin/PluginManagerCMDInstaller.sh status

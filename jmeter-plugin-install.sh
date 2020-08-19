#!/bin/sh
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar --output /opt/apache/apache-jmeter-${JMETER_VERSION}/cmdrunner-2.2.jar

curl -L https://jmeter-plugins.org/get/ --output /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar

java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

chmod a+x ${JMETER_HOME}/bin/*.sh

PluginManagerCMDInstaller.sh install \
blazemeter-debugger=0.6

PluginManagerCMDInstaller.sh status

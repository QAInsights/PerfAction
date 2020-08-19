#!/bin/sh
echo ${JMETER_HOME}
echo ${JMETER_CMD_RUNNER_VERSION}
echo ${JMETER_PLUGIN_MANAGER_VERSION}

curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar --output /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/cmdrunner-2.2.jar
echo "Downloaded CMDRunner"
curl -L https://jmeter-plugins.org/get/ --output /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar
echo "Downloaded Plugin Manager"

java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
echo "Java Step"

cd /opt/apache/apache-jmeter-${JMETER_VERSION}/bin/

java -jar /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/cmdrunner-2.2.jar --tool org.jmeterplugins.repository.PluginManagerCMD %*

chmod a+x /opt/apache/apache-jmeter-${JMETER_VERSION}/bin/*.sh

/opt/apache/apache-jmeter-${JMETER_VERSION}/bin/PluginsManagerCMD.sh install \
blazemeter-debugger=0.6

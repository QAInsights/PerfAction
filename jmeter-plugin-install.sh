#!/bin/sh
echo ${JMETER_HOME}
echo ${JMETER_CMD_RUNNER_VERSION}
echo ${JMETER_PLUGIN_MANAGER_VERSION}

echo "Downloading CMDRunner"
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${JMETER_CMD_RUNNER_VERSION}/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar --output ${JMETER_HOME}/lib/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar

echo "Downloading Plugin Manager"
curl -L https://jmeter-plugins.org/get/ --output ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar

java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

cd /opt/apache/apache-jmeter-${JMETER_VERSION}/bin/
java -jar ${JMETER_HOME}/lib/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar --tool org.jmeterplugins.repository.PluginManagerCMD install jpgc-udp=0.4

chmod a+x ${JMETER_HOME}/bin/*.sh

pwd

ls -l ${JMETER_HOME}/bin/*.sh

#PluginsManagerCMD install jpgc-udp=0.4

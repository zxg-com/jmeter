#!/bin/bash

CMD_RUNNER_URL="http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar"
PLUGIN_MANAGER_URL="https://jmeter-plugins.org/get/"

# 下载cmdrunner.jar
wget -O "lib/cmdrunner-2.2.jar" $CMD_RUNNER_URL

# 下载插件manager
wget -O "lib/ext/jmeter-plugins-manager.jar" $PLUGIN_MANAGER_URL


# #执行安装插件操作
java -cp lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller



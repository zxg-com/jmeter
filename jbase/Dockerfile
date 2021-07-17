FROM openjdk:8-jre-slim

# 定义jmeter版本
ARG JMETER_VERSION=5.3


# 安装容器内部工具
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
                wget \
                telnet \
                net-tools \
                vim \
                unzip 

# 下载安装 jmeter
RUN mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
	&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
	&& rm apache-jmeter-$JMETER_VERSION.tgz


#设置环境变量和工作空间
ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

ENV PATH $JMETER_HOME/bin:$PATH

# 切换至jmeter目录
WORKDIR $JMETER_HOME

#拷贝
COPY config/user.properties bin/user.properties
COPY scripts/install_plugin-manager.sh .
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x install_plugin-manager.sh /docker-entrypoint.sh
# 安装插件
RUN ./install_plugin-manager.sh
COPY jars/* lib/ext/
# 暴露端口
EXPOSE 60000 
# docker-compose.yml文件中定义command命令启动方式master和slaver
ENTRYPOINT ["/docker-entrypoint.sh"]

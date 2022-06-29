FROM tomcat:8.5.79-jdk8-openjdk-slim-buster
WORKDIR /usr/local
RUN apt update && apt upgrade -y &&\
    apt install -y wget &&\
    wget https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-8.0.28.tar.gz -O mysql-jdbc.tar.gz &&\
    tar -xvzf mysql-jdbc.tar.gz &&\
    rm /usr/local/mysql-jdbc.tar.gz &&\
    cp /usr/local/mysql-connector-java-8.0.28/mysql-connector-java-8.0.28.jar $CATALINA_HOME/lib/mysql-connector-java-8.0.28.jar &&\
    rm -rf /usr/local/mysql-connector-java-8.0.28 &&\
    echo 'export CLASS_PATH=$CATALINA_HOME/lib/servlet-api.jar' >> ~/.bashrc &&\
    echo 'export CLASS_PATH=$CLASS_PATH:$CATALINA_HOME/lib/mysql-connector-java-8.0.28.jar' >> ~/.bashrc
WORKDIR /usr/local/tomcat/webapps

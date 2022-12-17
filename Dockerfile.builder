FROM maven:openjdk:18-jdk-slim
RUN apt update && \
    apt install git
ARG USER PASSWORD HOST DATABASE
ENV REPO_DIR=repo \
    REPO=https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git \
    CONF_FILE=WebContent/Config.properties
RUN git clone $REPO /$REPO_DIR
WORKDIR /$REPO_DIR
RUN sed -i 's/ROOT/webapps\/ROOT/' \
    src/com/shephertz/app42/paas/sample/util/Util.java
RUN echo -e "\
app42.paas.db.username = $USER\n\
app42.paas.db.port = 3306\n\
app42.paas.db.password = $PASSWORD\n\
app42.paas.db.ip = $HOST\n\
app42.paas.db.name = $DATABASE\n\
" > $CONF_FILE
RUN mvn package
CMD rm -rf /webapps/ROOT* && \
    cp target/*.war /webapps/ROOT.war
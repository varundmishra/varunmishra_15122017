#Use Centos6 Base Image
FROM centos:centos6.9
#Setup SCL repo on CentOS6 for Python2.7
RUN yum install -y centos-release-SCL
#Install Python 2.7
RUN yum install -y python27
#Setup MongoDB Repo on CentOS6
RUN echo '[10gen]' >> /etc/yum.repos.d/10gen.repo
RUN echo 'name=10gen Repository' >> /etc/yum.repos.d/10gen.repo
RUN echo 'baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64' >> /etc/yum.repos.d/10gen.repo
RUN echo 'gpgcheck=0' >> /etc/yum.repos.d/10gen.repo
RUN echo 'enabled=1' >> /etc/yum.repos.d/10gen.repo
#Install MongoDB and initscripts
RUN yum install -y mongo-10gen mongo-10gen-server initscripts
#Start and enable MongoDB service
RUN service mongod start
RUN chkconfig mongod on
#Seup Dependencies for Tomcat7
RUN yum install -y wget tar java-1.7.0
#Set Working Directory to /opt
WORKDIR /opt
#Download Tomcat7 Archive
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
#Extract Tomcat7 Archive
RUN tar -zxvf apache-tomcat-7.0.82.tar.gz
#Expose Port 8080 of the container to enable access to Tomcat7 when running
EXPOSE 8080
#Start Tomcat
CMD /opt/apache-tomcat-7.0.82/bin/catalina.sh run
sudo yum instal git 

sudo yum install -y curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="ec2-54-72-114-77.eu-west-1.compute.amazonaws.com" yum install -y gitlab-ee


yum install java-1.8.0-openjdk
yum install y java-1.8.0-openjdk-devel
cd /opt
wget http://apache.mirror.anlx.net/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gzhttp://apache.mirror.anlx.net/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
wget http://apache.mirror.anlx.net/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar xzvf *.gz
export PATH=/opt/apache-maven-3.6.0/bin:$PATH
cd ~
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
cd my-app
mvn package
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
vim src/main/java/com/mycompany/app/App.java
mvn package
java -cp target/*.jar com.mycompany.app.App
cd ..
ll
mvn archetype:generate -DgroupId=downloader -DartifactId=downloader -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
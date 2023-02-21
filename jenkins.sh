#!/usr/bin/env bash

sudo apt-get install autoconf bison build-essential libffi-dev libssl-dev
sudo apt-get install libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev curl git vim

# install Jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

# config sql to Jenkins
sudo apt-get install mysql-client libmysqlclient-dev mysql-server

# init user
mysql --user=root --password=root -e \
  "CREATE USER 'jenkins'@'localhost' IDENTIFIED BY 'jenkins';
   GRANT ALL PRIVILEGES ON * . * TO 'jenkins'@'localhost';
   FLUSH PRIVILEGES;\q"

# init file
sudo touch /var/lib/jenkins/sample_database.yml

# mod permission
sudo chmod 755 /var/lib/jenkins/sample_database.yml


# def config
cat <<EOT >> /var/lib/jenkins/sample_database.yml
default: &default
  adapter: mysql2
  username: 'jenkins'
  password: 'jenkins'
  host: 'localhost'
  pool: 100
  encoding: utf8
  reconnect: true
test:
  <<: *default
  database: <%= "sample-test-#{ENV['BUILD_TAG']}" %>
EOT
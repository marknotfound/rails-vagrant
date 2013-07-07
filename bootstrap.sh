#!/usr/bin/env bash

sudo su

if [ ! -d "/var/www" ];
then
    mkdir /var/www
    apt-get -y update

    # Install some utility items
    apt-get install -y git subversion vim make

    # Install sqlite and nodejs for javascript runtime
    apt-get install -y sqlite3 libsqlite3-dev nodejs

    # Clone the rbenv repo from github
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    cd ~/.rbenv

    # Add rbenv to PATH
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
    echo 'eval "$(rbenv init -)"' >> ~/.profile
    source ~/.profile

    # Install ruby-build
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    # Install and use ruby 2.0.0-rc2
    rbenv install 2.0.0-rc2
    rbenv rehash
    rbenv global 2.0.0-rc2

    gem install rails
    gem install sqlite3 -v '1.3.7'
    gem install execjs

    source ~/.profile

    # Create a default project
    rails new /vagrant/www/default

    # Set up the sites directory
    ln -s /vagrant/www /var/www
fi

cd /vagrant/www/default

# Start up the default server as a daemon
rails server -d -e development -p 80

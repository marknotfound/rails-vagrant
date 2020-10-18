## Ruby on Rails Vagrant Box

### UPDATE: This repo has not been maintained for years. Please consider using docker and docker-compose instead.

### Getting Started
- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) for free.
- Install the latest version of [Vagrant](http://downloads.vagrantup.com/) for free.
- Clone this repo and vagrant up

```bash
$ git clone https://github.com/markdunphy/rails-vagrant.git
$ cd rails-vagrant
$ vagrant up
```
- Wait for some time while Vagrant downloads the Ubuntu server image and automatically sets up your new Rails development environment.
- When everything is finished, visit http://10.0.33.36/ in your browser to see the Rails test page.

### Other Details
- There is a default project created in /var/www on your new guest machine (which is symlinked to /vagrant/www on your guest machine or rails-vagrant/www on your host machine).
- It's probably nicer if you edit your hosts to set up a domain to point to 10.0.33.36 for easier access.
- The environment on the default project is set to 'development'
- This build uses [rbenv](https://github.com/sstephenson/rbenv) instead of rvm.
- To create a new Rails project:

```bash
rails-vagrant markdunphy$ vagrant ssh # SSH into the guest machine
vagrant@precise32:~$ sudo su # Gain root
root@precise32:/home/vagrant# rails new /vagrant/www/new-project-name-here # Create new project
```

### Contributing
- Feel free to make a pull request (fork, branch, pull) adding something to the bootstrap.sh file to add new functionality. I'll most likely accept it.

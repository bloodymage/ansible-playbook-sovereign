# Ansible CFG

# Directory Structure

hosts.yaml              # inventory file (All of us have testing environments
                        # Few are lucky to have a separate production environment)
                        
groupvars/
   all/
     all.yaml
     vault
   group1/
     group1.yml           # here we assign variables to particular groups
   group2.yml
hostvars/
   hostname1/
     hostname1.yml        # here we assign variables to particular systems
     vault
   hostname2.yml
            
library/                # if any custom modules, put them here (optional)
moduleutils/            # if any custom module_utils to support modules, put them here (optional)
filterplugins/          # if any custom filter plugins, put them here (optional)
            
site.yml                # master playbook
webservers.yml          # playbook for webserver tier
dbservers.yml           # playbook for dbserver tier
            
roles/
   common/               # this hierarchy represents a "role"
       tasks/            #
           main.yml      #  <-- tasks file can include smaller files if warranted
       handlers/         #
          main.yml       #  <-- handlers file
      templates/         #  <-- files for use with the template resource
          ntp.conf.j2    #  <------- templates end in .j2
      files/             #
          bar.txt        #  <-- files for use with the copy resource
          foo.sh         #  <-- script files for use with the script resource
      vars/              #
           main.yml      #  <-- variables associated with this role
       defaults/         #
           main.yml      #  <-- default lower priority variables for this role
       meta/             #
           main.yml      #  <-- role dependencies
       library/          # roles can also include custom modules
       moduleutils/      # roles can also include custom moduleutils
       lookup_plugins/   # or other types of plugins, like lookup in this case

webtier/          # same kind of structure as "common" was above, done for the webtier role
monitoring/       # ""
fooapp/           #

# Playbooks

## all.yaml

## localhost.yaml

## nightly.yaml
Provides for Nightly tasks

## sensehat.yaml

## site.yaml
Provides sitewide initialization and configuration

## siteinfo.yaml

## shutdown.yaml
Shuts down all systems

# Roles
## Ansible Roles
### [roles/site-info/README.md]Site Information
Gathers information about all managed hosts

### [roles/ansible-node-setup/README.md]Ansible Control Node Setup
Provides base configuration the ansible nodes.

### [roles/ansible-users/README.md] Setup ansible users

## Openssl Configuration
### [roles/openssl/README.md]SSL CA Setup

## Openssh Role
### [roles/openssh/README.md]SSH CA Setup

## etckeeper Role
### [roles/etckeeper/README.md]Etckeeper Setup

## Bind Role
### [roles/bind/README.md]Bind9 Setup

## Samba Role
### [roles/bind/README.md]Samba Setup

## Glances Role
### [roles/glances/README.md] Glances Setup
Glances provides system information

## Reboot
### [roles/reboot/README.md] Reboot systems

## Shutdown
### [roles/shutdown/README.md] Shutsdown systems

## Sensehat
### [roles/sensehat/README.md] Sensehat setup

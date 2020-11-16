# Ansible Collection - bloodymage.soverign

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Features and Advantages](#features-and-advantages)
- [Similar Projects](#similar-projects)
- [Sources](#sources)
- [Contributing](#contributing)
- [License](#license)

## Description
This collection is a set of ansible playbooks that you can use to build and maintain your own personal network servers.  There are three goals I have with this project.
1. I wanted to learn how to use Ansible
2. I wanted to better control my data.
3. I wanted a way to quickly and easily rebuild my network if absolutely necessary.

Some smaller goals that I have for this project is minimizing the variables I have to define in my inventory.  For each role, having sensible defaults, and the fine tuning done in the inventory requires the least amount of definitions as possible.

## Installation
### Ansible Galaxy
### Github

## Usage

Create your inventory.  Set variables according to [Variables](#Variables).  Again, most variables are designed to be optional.  For the network zone it expects a naming scheme along the lines of: "zone.example.com"
For example, your internal network will be internal.example.com, and a dmz zone would be dmz.example.com, and each host will be named host.internal.example.com

'''ansible-playbook bloodymage/sovereign/playbooks/site.yml'''

This will create your site.

Any host that you wish to be accessible from the outside world, will use letsencrypt for certs, otherwise it will use internal certificate authority certs.

### Roles
#### [ACME CA Certs](roles/acmeca-host-certs/README.md)
#### [Dovecot](roles/dovecot/README.md)
#### [OWNCA](roles/ownca/README.md)

### Variables
#### Global Variables
#### Role variables are defined in each role's README.md
#### Passwords

By default, if a password is defined as 'password' a password will be generated using password_store, and the generated password will be used.  To view the passwords in the password store type:
"pass ..."

Passwords that can be defined:
- keycloak_admin_password
- keycloak_keystore_password
- ownca_root_password
- ownca_intermediate_password
- ownca_component_password
- ownca_identity_password
- ownca_codesign_password

## Features and Advantages
...

### Similar Projects
#### Sovereign
- Website: [https://github.com/sovereign/sovereign]


### Sources
#### Ansible Documentation
#### Ansible Examples
#### Geerlinguy


## Contributing

## License

# Ansible Collection - bloodymage.rebeldream

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

### Roles
#### [ACME CA Certs](roles/acme-ca-certs/README.md)

### Variables
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




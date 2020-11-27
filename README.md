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
This collection is a set of ansible playbooks that you can use to build and maintain your own personal self-hosted services.  
Initial services are:
1. Email (Postfix and Dovecot)
2. Address Book and Calendars (Nextcloud)
3. Cloud Storage (Nextcloud)
4. File server (Samba)

For access to these services, a focus on centralized user management with a goal of single sign on across all services.  Eventually I will add smart card capabilities to minimize password requirements. 

There are three reasons I had with creating this with this project.
1. I wanted to learn how to use Ansible
2. I wanted to better control my data.
3. I wanted a way to quickly and easily rebuild my network if absolutely necessary.

Some smaller goals that I have for this project is minimizing the variables I have to define in my inventory.  For each role, having sensible defaults, and the fine tuning done in the inventory requires the least amount of definitions as possible.  In addition, I have set it up to simplify password management for various services by using ansible's passwordstore lookup to generate and save any passwords necessary.

## Installation
### Ansible Galaxy
### Github

## Usage

Create your inventory.  Set variables according to [Variables](#Variables).  Again, most variables are designed to be optional.  For the network zone it expects a naming scheme along the lines of: "zone.example.com"
For example, your internal network will be internal.example.com, and a dmz zone would be dmz.example.com, and each host will be named host.internal.example.com.  See [docs/INVENTORY.md](docs/INVENTORY.md) for more information.

```ansible-playbook bloodymage/rebeldream/playbooks/site.yml```

This will create your site.

Any host that you wish to be accessible from the outside world, will use letsencrypt for certs, otherwise it will use internal certificate authority certs.

### Roles
#### [ACME CA Certs](roles/acmeca_host_certs/README.md)
#### [Apache](roles/apache/README.md)
#### [Bind](roles/bind/README.md)
#### [Collection Handlers](roles/collection_handlers/README.md)
#### [DNS Forward Zones](roles/dns_forwardzones/README.md)
#### [DNS Reverse Zones](roles/dns_reversezones/README.md)
#### [Dotfiles](roles/dotfiles/README.md)
#### [Dovecot](roles/dovecot/README.md)
#### [Etckeeper](roles/etckeeper/README.md)
#### [Global Packages](roles/global_packages/README.md)
#### [Hostname](roles/hostname/README.md)
#### [Hosts](roles/hosts/README.md)
#### [Keycloak](roles/keycloak/README.md)
#### [KRB5 Client Config](roles/krb5_client_config/README.md)
#### [MariaDB](roles/mariadb/README.md)
#### [MySQL Databases](roles/mysql_databases/README.md)
#### [Nextcloud](roles/nextcloud/README.md)
#### [NTP](roles/ntp/README.md)
#### [OpenSSH](roles/openssh/README.md)
#### [OWNCA](roles/ownca/README.md)
#### [OWNCA CRL](roles/ownca_crl/README.md)
#### [OWNCA Host Certificates](roles/ownca_host_certs/README.md)
#### [OWNCA User Certificates](roles/ownca_user_certs/README.md)
#### [Password-Store](roles/password_store/README.md)
#### [Postfix](roles/postfix/README.md)
#### [Reboot](roles/reboot/README.md)
#### [Samba Domain Controller](roles/samba_domain_controller/README.md)
#### [Samba Domain Users](roles/samba_domain_users/README.md)
#### [Samba File Server](roles/samba_file_server/README.md)
#### [Shutdown](roles/shutdown/README.md)
#### [SSHCA](roles/sshca/README.md)
#### [SSHCA Host Certificates](roles/sshca_host_certs/README.md)
#### [SSHCA User Certificates](roles/sshca_user_certs/README.md)
#### [SSSD](roles/sssd/README.md)
#### [SUDO](roles/sudo/README.md)
#### [System Upgrade](roles/system_upgrade/README.md)
#### [Users](roles/users/README.md)
#### Websites
##### [Mediawiki](roles/website_mediawiki/README.md)
##### [Nextcloud](roles/nextcloud/README.md)


### Variables
#### Global Variables
##### Users
##### Domain Users

#### Role variables are defined in each role's README.md
#### Passwords

Passwords are managed through the use of [Password Store](https://password-store.org).
To view the passwords in the password store type:
"pass ..."  

If you wish to manually generate your passwords, the following passwords can be defined in your vault:
- keycloak_admin_password
- keycloak_keystore_password
- ownca_root_password
- ownca_intermediate_password
- ownca_component_password
- ownca_identity_password
- ownca_codesign_password
- samba_administrator_password

For more information see: [Password Storage](#password-storage)

## Features and Advantages

### Identity Management

This collection can use a Samba domain for identity management.  This way you can have one password for all services:
- Login
- Email
- Nextcloud (Calendars, Cloud Storage)
- File Servers

Planned modifications will be single sign on, through use of Kerberos and Keycloak.

### Password Storage
  By default, all passwords default variables are set to "password."  When a password is encountered that is set to "password," a password will be generated using password_store, and the generated password will be used.  This creates the following advantages:
  1. You do not need to generate your passwords yourself.
  2. You can create backups, and distribute the passwords via git/gpg (Add specific user gpg keys to any folder you wish to grant access. )
  
Not yet implemented advantages:
  3. If you believe multiple passwords may be compromised, you can easily force a regeneration of all passwords.  Plan is to add a tags for password regeneration.  Currently, you can use the password store itself to modify the password(s).
  
### 

### Similar Projects
#### [Sovereign](https://github.com/sovereign/sovereign)

Sovereign is a set of ansible playbooks to build and maintain your own private servers: 
- email
- calendar
- contacts
- file sync
- IRC bouncer
- VPN
- and more. 

### References
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
- [Ansible Examples](https://github.com/ansible/ansible-examples)
- [Geerlinguy](https://ansible.jeffgeerling.com/)
- [Awesome Self-Hosted](https://github.com/awesome-selfhosted/awesome-selfhosted)
- [Reddit: Selfhosted](https://www.reddit.com/r/selfhosted/)

## Contributing
[How to Contribute](CONTRIBUTING.md)

## License
[MIT](LICENSE.md)

## Author Information
G Derber 
gd.github@bloodymage.org

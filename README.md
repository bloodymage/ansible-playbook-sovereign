# Ansible Collection - bloodymage.rebeldream

[![Ansile-Lint](https://github.com/bloodymage/ansible-collection-rebeldream/workflows/Ansible%20Lint/badge.svg?event=push)](https://github.com/bloodymage/ansible-collection-rebeldream/actions?query=workflow%3A%22Ansible+Lint%22)

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

For single signon, I use native SSO capabilities where possible, keycloak Identity Provider native SSO doesn't work.

There are three reasons I had with creating this with this project.
1. I wanted to learn how to use Ansible
2. I wanted to better control my data.
3. I wanted a way to quickly and easily rebuild my network if absolutely necessary.

Some smaller goals that I have for this project is minimizing the variables I have to define in my inventory.  For each role, having sensible defaults, and the fine tuning done in the inventory requires the least amount of definitions as possible.  In addition, I have set it up to simplify password management for various services by using ansible's passwordstore lookup to generate and save any passwords necessary.

Another overall goal, is minimizing impact to the complete system if one piece fails.  This is why Samba uses Bind9 as it's DNS server rather than it's own internal DNS server.

### Name

In the spirit of freedom to control _your_ data I initially named this project "Rebel Dream" after the Star Wars [starship](https://starwars.fandom.com/wiki/Rebel_Dream) of the same name.

I wanted the freedom to tinker and have my systems work the way I wanted. I was tired of systems and applications I used and liked being killed off. I wanted to be self sufficient. I felt that in a way, the name captures that feeling.

Other names that feel appropriate: Sovereign, Self-Hosted, are either already in use, or while they clearly indicate what this project is, don't quite capture the spirit behind this project.

That said, "Rebel dream" doesn't quite feel right either.  Looking for a new name: See issue [#238](https://github.com/bloodymage/ansible-collection-rebeldream/issues/238), feel free to comment.

## Installation
### Ansible Galaxy

TBD

### Github

```
mkdir -p ~/.ansible/collections/ansible_collections/bloodymage
cd ~/.ansible/collections/ansible_collections/bloodymage
git clone https://github.com/bloodymage/ansible-collection-rebeldream rebeldream
```

## Usage

Create your inventory.  Set variables according to [Variables](#Variables).  Again, most variables are designed to be optional.  For the network zone it expects a naming scheme along the lines of: "zone.example.com"
For example, your internal network will be internal.example.com, and a dmz zone would be dmz.example.com, and each host will be named host.internal.example.com.  See [docs/INVENTORY.md](docs/INVENTORY.md) for more information.

```
ansible-playbook bloodymage/rebeldream/playbooks/site.yml
```

This will create your site.

Any host that you wish to be accessible from the outside world, will use letsencrypt for certs, otherwise it will use internal certificate authority certs.

### Roles ([Full list](docs/ROLES.md))

#### Identity Management
##### [Samba Domain Controller](roles/samba_domain_controller/README.md)
##### [Samba Domain Users](roles/samba_domain_users/README.md)

#### Email
##### [Dovecot](roles/dovecot/README.md)
##### [Postfix](roles/postfix/README.md)

#### Groupware (Calendar and Contacts)
##### [Nextcloud](roles/nextcloud/README.md)

#### Cloud Storage / File sync / Fileserver
##### [Nextcloud](roles/nextcloud/README.md)
##### [Samba File Server](roles/samba_file_server/README.md)

### Variables

Note: This is still in early development.  Some of the variable descriptions and requirements listed below pertain more to how it is planned to eventually work, than how it works right now.

#### Global Variables

##### Users
```
users:
  - username: bob          (mandatory)
    id_number: 1000        (mandatory)

```
##### Domain Users

```
domain_users:
  - given_name: Bob        (Mandatory)
    id_number: 10000       (Mandatory)
    username: bob          (optional)
    surname: bobsurname    (optional)
    middle_name: bobmid    (optional)
    password:              (optional)
```

If the username is not defined, then it will be created based on other defined variables (given_name, surname if available, middle_name if available, and a random number.  If password is defined, the defined password will be used, otherwise a password will be generated (see [Passwords](#Passwords))

##### Choices

The following are optional choices that are not required to be defined.

```smart_card_usage: no```        Options: yes\no
```realm_management_system: ""``` Options: "" (not thoroughly tested), Samba, OpenLDAP (not implemented), FreeIPA (not implemented)

#### Role variables
Each role's variables are defined in their README.md file.

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

Planned modifications will be single sign on, through use of Kerberos and Keycloak.  This partially works now, email single sign on in linux for clients that support GSSAPI currently works.  Keycloak and nextcloud can be configured (through their web interface) to use single sign on as well.  The tweaks that are necessary involve windows email clients (Thunderbird works, Outlook does not) and configuring keycloak and nextcloud through their CLI via ansbile.

A note on Samba and DNS:
While Samba provides it's own internal DNS server, this setup has opted to use Bind9 DNS instead, and configure Samba DCs to use Bind9.  This is decision was made to minimize the impact to the various network services the event of the Samba DC process crashing.  In that case only the Samba DC service is lost, DNS will still work.

### Certificate Authority

This collection will maintain an internal certificate authority.  It will also configure the browsers to recognize your certificate authority.  So all internal sites are verified.  In addition this allows you to use smart cards authentication within active directory.

For sites that are publicly available, the site will use an acme ca  (Let's encrypt, etc).

### Password Storage

  By default, all passwords default variables are set to "password."  When a password is encountered that is set to "password," a password will be generated using password_store, and the generated password will be used.  This creates the following advantages:
  1. You do not need to generate your passwords yourself.
  2. You can create backups, and distribute the passwords via git/gpg (Add specific user gpg keys to any folder you wish to grant access. )
  
Not yet implemented advantages:
  3. If you believe multiple passwords may be compromised, you can easily force a regeneration of all passwords.  Plan is to add a tags for password regeneration.  Currently, you can use the password store itself to modify the password(s).
  
### Role structure

Each role is built with the idea of do one thing, and do it well.  So there will be many more roles than other projects might have.  The advantage is that you don't have to run every role every time.  Each role can be selected individually by using '--tag' with the role's name, for example '--tag dovecot' will run the dovecot role.  If you wish to run all roles related to email servers, you would run the playbook 'mailservers.yml'

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

#### [Debops](https://docs.debops.org/en/master/) [DebOps Github](https://github.com/debops/debops)

Your Debian-based data center in a box.

The DebOps project is a set of Free and Open Source tools that let users bootstrap and manage an IT infrastructure based on Debian or Ubuntu operating systems. Ansible is used as the main configuration management platform. DebOps provides a collection of Ansible roles that manage various services, as well as a set of Ansible playbooks that tie them together in a highly integrated environment.

#### [FreedomBox](https://www.freedombox.org/)

FreedomBox is a private server for non-experts: it lets you install and configure server applications with only a few clicks. It runs on cheap hardware of your choice, uses your internet connection and power, and is under your control.

#### [Yunohost](https://yunohost.org)

YunoHost is an operating system aiming for the simplest administration of a server, and therefore democratize self-hosting, while making sure it stays reliable, secure, ethical and lightweight. It is a copylefted libre software project maintained exclusively by volunteers. Technically, it can be seen as a distribution based on Debian GNU/Linux and can be installed on many kinds of hardware.

### Related Projects
#### [Hearthminion](https://github.com/hearthminion/ansible-collection-hearthminion)

The Hearthminion ansible collection expands on this collection adding in new features relating to home automation and entertainment.
- Home Assistant
- MythTV
- RetroPie

### References and inspiration
- [Ansible Documentation](https://docs.ansible.com/ansible/latest/index.html)
- [Ansible Examples](https://github.com/ansible/ansible-examples)
- [Geerlinguy](https://ansible.jeffgeerling.com/)
- [Awesome Self-Hosted](https://github.com/awesome-selfhosted/awesome-selfhosted)
- [Reddit: Selfhosted](https://www.reddit.com/r/selfhosted/)
- [Self-hosted Cookbook](https://github.com/tborychowski/self-hosted-cookbook/)

## Contributing
[How to Contribute](CONTRIBUTING.md)

## License
[MIT](LICENSE.md)

## Author Information
G Derber 
gd.github@bloodymage.org

# Ansible Collection - bloodymage.autonomy

[![Ansile-Lint](https://github.com/bloodymage/ansible-collection-autonomy/workflows/Ansible%20Lint/badge.svg?event=push)](https://github.com/bloodymage/ansible-collection-autonomy/actions?query=workflow%3A%22Ansible+Lint%22)

# Help Wanted

Looking for help.  Let me know if you are interested.

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
1. [Certificate Authorities](docs/CERTIFICATE_AUTHORITIES.md) (Internal and ACME)
2. An SSH Certificate Authority
3. DNS (Bind9)
4. Identity Management (Samba Active Directory)
5. Email (Postfix and Dovecot)
6. Address Book and Calendars (Nextcloud)
7. Cloud Storage (Nextcloud)
8. File server (Samba / NFS)

For access to these services, a focus on centralized user management with a goal of single sign on across all services.  Eventually I will add smart card capabilities to minimize password requirements. 

For single signon, I use native SSO capabilities where possible, keycloak Identity Provider native SSO doesn't work.

There are three reasons I had with creating this with this project.
1. I wanted to learn how to use Ansible
2. I wanted to better control my data.
3. I wanted a way to quickly and easily rebuild my network if absolutely necessary.

So far, each server is configured without using docker containers or any other group packages, for example: dovecot and postfix vs iRedMail.  I chose this route to learn as much as possible about each service and it's requirements.

Some smaller goals that I have for this project is minimizing the variables I have to define in my inventory.  For each role, having sensible defaults which can be modified at runtime based on other configuration settings.  For example if you are using smart cards, enable smart card required settings.  These basic options can be set via inventories.  In addition, I have set it up to simplify password management for various services by using ansible's passwordstore lookup to generate and save any passwords necessary.

Another overall goal, is minimizing impact to the complete system if one piece fails.  This is why Samba uses Bind9 as it's DNS server rather than it's own internal DNS server.

## Installation
### Ansible Galaxy

TBD

### Github

```
mkdir -p ~/.ansible/collections/ansible_collections/bloodymage
cd ~/.ansible/collections/ansible_collections/bloodymage
git clone https://github.com/bloodymage/ansible-collection-autonomy autonomy
```

## Usage

### Create GPG

Create a GPG key for the user that will be using ansible and the collection playbooks.

### Create your [inventory](docs/INVENTORY.md).

Create your inventory.  Set variables according to [Variables](#Variables).  Again, most variables 
are designed to be optional.  For the network zone it expects a naming scheme along the lines of: 
"zone.example.com"

For example, your internal network will be internal.example.com, and a dmz zone would be 
dmz.example.com, and each host will be named host.internal.example.com.  See [docs/INVENTORY.md](docs/INVENTORY.md) 
for more information.

```
ansible-playbook bloodymage/autonomy/playbooks/site.yml
```

This will create your site.

Any host that you wish to be accessible from the outside world, will use letsencrypt for certs, 
otherwise it will use internal certificate authority certs.

### Roles ([Full list](docs/ROLES.md))

#### Identity Management
##### [Samba](roles/samba/README.md)
##### [Realm Users](roles/realm_users/README.md)

#### Email
##### [Dovecot](roles/dovecot/README.md)
##### [Postfix](roles/postfix/README.md)

#### Groupware (Calendar and Contacts)
##### [Nextcloud](roles/nextcloud/README.md)

#### Cloud Storage / File sync / Fileserver
##### [Nextcloud](roles/nextcloud/README.md)
##### [Samba](roles/samba/README.md)

### [Variables](docs/VARIABLES.md)

This section provides the bare minimum listing of variables that need to be defined.  For the full listing see [docs/VARIABLES.md](docs/VARIABLES.md).
Note: This is still in early development.  Some of the variable descriptions and requirements listed 
below pertain more to how it is planned to eventually work, than how it works right now.

#### Global Variables

##### Decisions
```
autonomy_realm_identity_management_system: ""
```

Options:
 - "" (Not set)
 - samba
 - openldap (planned for the future)
 - freeipa (planned for the future)
 
So far, this collection has really only been tested with this variable set to ```samba```.  You must set it yourself.  Things can, and most likely will go wrong if it's not set to ```samba```.

##### Network structure
```
autonomy_root_domain: "example.com"
```

This next variable, I hope to eliminate one day.  To do so, I need to set the values based on the 
zone group_vars.  For now, it may seem redundant, but it is required.

within each dictionary, the 'samba_domain' variable is semi-optional, if undefined it defaults to 
'no'.  It needs to be set to yes if you have a samba domain in that zone.

The 'type' variable, and the 'autonomy_zone_type' variable below it have the following options:
- internal
- dmz
- public

```
autonomy_zones:
  - name: "internal"
    type: "internal"
    domain: "internal.{{ autonomy_root_domain }}"
    samba_domain: yes                                         
  - name: "dmz"
    type: "dmz"
    domain: "dmz.{{ autonomy_root_domain }}"
  - name: "example"
    type: "public"
    domain: "{{ autonomy_root_domain }}"
```

For each zone, you'll need to set the following group variables:

```
autonomy_zone_type: "internal"
autonomy_zone_name: "internal"
```

These are required to match the 'name' and 'type' set in the autonomy_zones listing.


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

For domain users, if the username is not defined, then it will be created based on other defined 
variables (given_name, surname if available, middle_name if available, and a random number.  If 
password is defined, the defined password will be used, otherwise a password will be generated 
(see [Passwords](#Passwords))

#### [Role](docs/ROLES.md) variables
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

#### Post run configuration.

Not everything is configured via ansible.  There are a few things that can't be done (yet, hopefully?) that you will need to configure manually yourself.

1. [Smartcards](docs/SMARTCARDS.md)
2. [Keycloak](roles/keycloak/README.md)
3. [Windows ACLs](roles/samba/README.md)

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

Each of these projects are excellent projects, they didn't quite meet my needs.

1. Again, I wanted to actually learn how to use ansible.
2. I am in a mixed linux/windows environment.  So, I wanted a Samba AD Domain, which none provide.
3. I wanted smart card support, which none provided.

#### Ansible Based
##### [Debops](https://docs.debops.org/en/master/) ([DebOps Github Repo](https://github.com/debops/debops))

Your Debian-based data center in a box.

The DebOps project is a set of Free and Open Source tools that let users bootstrap and manage an IT infrastructure based on Debian or Ubuntu operating systems. Ansible is used as the main configuration management platform. DebOps provides a collection of Ansible roles that manage various services, as well as a set of Ansible playbooks that tie them together in a highly integrated environment.

##### [Sovereign](https://github.com/sovereign/sovereign)

Sovereign is a set of ansible playbooks to build and maintain your own private servers: 
- email
- calendar
- contacts
- file sync
- IRC bouncer
- VPN
- and more. 

##### [Homebox](https://github.com/progmaticltd/homebox)

A set of Ansible scripts to setup a secure email and personal files server.


| Project                  | Autonomy                                                  | DebOps                                              | Sovereign                                                              | HomeBox                                                                     |
| :------                  | :---------                                                | :-----                                              | :--------                                                              | :---------                                                                  |
| Uses Ansible             | Yes                                                       | Yes                                                 | Yes                                                                    | No                                                                          |
| Email                    | Dovecot<br>Postfix                                        | Dovecot<br>Postfix                                  |                                                                        |                                                                             |
| Identity Management      | Active Directory (Samba)                                  | LDAP (OpenLDAP)                                     |                                                                        |                                                                             |
| Groupware                | Nextcloud                                                 | Nextcloud?<br>Owncloud                              | OwnCloud                                                               |                                                                             |
| Cloud Storage            | Nextcloud                                                 | Nextcloud?<br>Owncloud                              | OwnCloud                                                               |                                                                             |
| Certificate Authority    | Internal<br>Let's Encrypt                                 |                                                     |                                                                        |                                                                             |
| DNS                      | Bind9                                                     |                                                     |                                                                        |                                                                             |
| Operating System Support | Linux                                                     | Linux                                               | Linux                                                                  |                                                                             |
| Distribution Support     | Debian                                                    | Debian                                              | Debian                                                                 |                                                                             |
| Smart Card Support       | Yes*                                                      |                                                     |                                                                        |                                                                             |
| License                  | [MIT](LICENSE.md)                                         | [GPLv3](https://github.com/debops/debops#licensing) | [GPLv3](https://github.com/sovereign/sovereign/blob/master/LICENSE.md) | [GPLv3](https://raw.githubusercontent.com/progmaticltd/homebox/dev/LICENSE) |
| Website                  | https://github.com/bloodymage/ansible-collection-autonomy | https://debops.org                                  | https://github.com/sovereign/sovereign                                 | https://github.com/progmaticltd/homebox                                     |

* Smart Card Support is still buggy

#### Non-Ansible Based
##### [FreedomBox](https://www.freedombox.org/)

FreedomBox is a private server for non-experts: it lets you install and configure server applications with only a few clicks. It runs on cheap hardware of your choice, uses your internet connection and power, and is under your control.

##### [HomelabOS](https://homelabos.com/)

Your offline-first privacy-centric personal data center.

Includes over 100 services you can easily self-host.

##### [Yunohost](https://yunohost.org)

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

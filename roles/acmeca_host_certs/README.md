Ansible Role: Bloodymage.rebeldream.acmeca_host_certs
===============

- [Description](#description)
- [Installation](#installation)
- [Requirements](#requirements)
- [Usage](#usage)
- [Role Variables](#role-variables)
- [Features and Advantages](#features-and-advantages)
- [Similar Projects](#similar-projects)
- [References](#references)
- [Contributing](#contributing)
- [License](#license)
- [Author Information](#author-information)

Description
-----------
Installs ACME CA certificates

Installation
------------

### Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

### Dependencies
```- role: bloodymage.rebeldream.collection_handlers```

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Usage
-----

### Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

### Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - { role: bloodymage.rebeldream.acmeca_host_certs, x: 42 }

Features and Advantages
-----------------------


Similar Projects
----------------
- [Felix Fontein: Acme-Certificate Role](https://github.com/felixfontein/acme-certificate/blob/main/tasks/main.yml)

References
----------
- [How to acquire a Let's Encrypt Certificate using ansible on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-acquire-a-let-s-encrypt-certificate-using-ansible-on-ubuntu-18-04)
- [Ansible Docs: community.crypto.acme_certificate_module ](https://docs.ansible.com/ansible/latest/collections/community/crypto/acme_certificate_module.html)

Contributing
------------
[Contributing](CONTRIBUTING.md.md)

License
-------
[MIT](LICENSE.md)

Author Information
------------------
G Derber
gd.github@bloodymage.org

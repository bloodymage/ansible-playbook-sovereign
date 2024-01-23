Ansible Role: bloodymage.autonomy.acmeca
=========

- [Description](#description)
- [Installation](#installation)
- [Requirements](#requirements)
- [Usage](#usage)
- [Role Variables](#role-variables)
- [Contributing](#contributing)
- [License](#license)
- [Author Information](#author-information)

Description
-----------

This role manages ACME CA Certificates.

Installation
------------
This is part of the **bloodymage.autonomy** collection and will not work without the full collection.  You will need to install the entire collection following the procedures listed for the [collection](https://github.com/bloodymage/ansible-collection-autonomy#installation)

Requirements
------------
This role depends on:
- python3-cryptography

If you haven't already installed python3-cryptography then this role will install it for you.

Usage
-----

This is part of the collection "webservers" playbook.

```
- name: "Configure webservers and websites."
  hosts: web_servers:&public_zone
  roles:
    - role: bloodymage.autonomy.config_acmeca_environment
    - role: bloodymage.autonomy.acmeca_challenge_site
      tags:
        - acmeca-challenge-site
        - acmeca
```

Role Variables
--------------

No role specific variables apply.  All variables used are global variables from the collection.


Similar Projects
--------------------
These projects helped inspire this role.

https://github.com/felixfontein/ansible-acme by Felix Fontein, (GPLv3 License)


Contributing
------------
[How to contribute](../../CONTRIBUTING.md)

License
-------
[MIT](../../LICENSE.md)

Author Information
------------------
G Derber
gd.github@bloodymage.org

Ansible Role: Bloodymage.autonomy.keycloak
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
Installs keycloak server

Installation
------------

### Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

### Dependencies
```
- role: bloodymage.autonomy.collection_handlers
```

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Usage
-----

### Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

### Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - { role: bloodymage.autonomy.keycloak, x: 42 }

Features and Advantages
-----------------------


Similar Projects
----------------

References
----------
- [Keycloak Documentation](https://www.keycloak.org/documentation)

Contributing
------------
[Contributing](CONTRIBUTING.md)

License
-------
[MIT](LICENSE.md)

Author Information
------------------
G Derber
gd.github@bloodymage.org

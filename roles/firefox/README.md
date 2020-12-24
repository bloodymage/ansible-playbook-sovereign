Ansible Role: Bloodymage.rebeldream.firefox
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
Installs and configures firefox on your workstations.

Installation
------------

### Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

### Dependencies
```
- role: bloodymage.rebeldream.collection_handlers
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
        - { role: bloodymage.rebeldream.firefox }

Features and Advantages
-----------------------

This role will install firefox on your workstations.  In addition, it will configure firefox to use your internal Certificate Authority for all users and their profiles.  Finally, if you are on a identity managed realm, it will enable kerberos login support for your specified sites.

Similar Projects
----------------

References
----------
- [Ask Ubuntu: Add Certificate Authorities system wide on firefox](https://askubuntu.com/questions/244582/add-certificate-authorities-system-wide-on-firefox)

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

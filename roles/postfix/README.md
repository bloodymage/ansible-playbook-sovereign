Ansible Role: Bloodymage.rebeldream.postfix
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
Installs Postfix MTA

Installation
------------

### Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

### Dependencies
  - role: bloodymage.rebeldream.collection_handlers
  - role: bloodymage.rebeldream.krb5_client_config

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Usage
-----

### Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

### Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - { role: bloodymage.rebeldream.postfix, x: 42 }

Features and Advantages
-----------------------


Similar Projects
----------------

References
----------
  [How to Run Your Own Email Server with Your Own Domain Parts I, II, III (Slightly outdated)](https://www.neowin.net/forum/topic/1206123-how-to-run-your-own-email-server-with-your-own-domain-parts-i-ii-iii/)
  [How To Run Your Own E-mail Server with Your Own Domain Part 1](http://arstechnica.com/information-technology/2014/02/how-to-run-your-own-e-mail-server-with-your-own-domain-part-1)
  [Taking Email Back Part 2: Arming Your Server with Postfix and Dovecot](https://arstechnica.com/information-technology/2014/03/taking-e-mail-back-part-2-arming-your-server-with-postfix-dovecot/)
  [Taking Email Back Part 3: Fortify Your Box Against Spammers](http://arstechnica.com/business/2014/03/taking-e-mail-back-part-3-fortifying-your-box-against-spammers/)
  [Taking Email Back Part 4: The Finale with Webmail Everything After](http://arstechnica.com/information-technology/2014/04/taking-e-mail-back-part-4-the-finale-with-webmail-everything-after/)
  [How to NSA Proof your email server](https://sealedabstract.com/code/nsa-proof-your-e-mail-in-2-hours)
  [Mail-in-a-box](https://mailinabox.email)
  [Raspberry Pi Email Server](https://samhobbs.co.uk/raspberry-pi-email-server)
  [Iredmail Docs: Active Directory](https://docs.iredmail.org/active.directory.html)
  [Serverfault: Samba4 Active Directory Dovecot Postfix LDAP Auth lookups](https://serverfault.com/questions/771252/samba4-active-directory-dovecot-postfix-ldap-auth-lookups)
  [Postfix: LDAP Readme](http://www.postfix.org/LDAP_README.html)

Contributing
------------
[Contributing](CONTRIBUTING.md.md)

License
-------
[MIT](MIT.md)

Author Information
------------------
G Derber
gd.github@bloodymage.org

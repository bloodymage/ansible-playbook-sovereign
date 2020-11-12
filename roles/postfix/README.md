Role Name
=========

Installs a fully functional mail server.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

References
----------
- https://sealedabstract.com/code/nsa-proof-your-e-mail-in-2-hours/
- https://github.com/sovereign/sovereign
- https://mailinabox.email
- https://samhobbs.co.uk/raspberry-pi-email-server
- https://docs.iredmail.org/active.directory.html
- http://arstechnica.com/information-technology/2014/02/how-to-run-your-own-e-mail-server-with-your-own-domain-part-1/
- https://arstechnica.com/information-technology/2014/03/taking-e-mail-back-part-2-arming-your-server-with-postfix-dovecot/
- http://arstechnica.com/business/2014/03/taking-e-mail-back-part-3-fortifying-your-box-against-spammers/
- http://arstechnica.com/information-technology/2014/04/taking-e-mail-back-part-4-the-finale-with-webmail-everything-after/
- https://dovecot.org/list/dovecot/2010-February/046763.html
- https://wiki.samba.org/index.php/Authenticating_Dovecot_against_Active_Directory
- https://serverfault.com/questions/771252/samba4-active-directory-dovecot-postfix-ldap-auth-lookups
- http://www.postfix.org/LDAP_README.html


bloodymage.autonomy.maintenance_wake_on_lan
=========

This role sends wake on lan packets to all hosts with the variable 'autonomy__mac_address' defined.

Requirements
------------

- The System BIOS must be properly configured.

Role Variables
--------------

Mandatory variables:

MAC address to send Wake-on-LAN broadcast packet for.  Set this at the host level in your inventory.
autonomy__mac_address: "00:00:5E:00:53:66"

Optional Variables:
autonomy__wol_broadcast: "255.255.255.255"
autonomy__wol_port: 7


Dependencies
------------

None

Playbook
----------------

This is included in the '[maintenance](../../playbooks/maintenance.yml)' playbook

```ansible-playbook bloodymage/autonomy/playbooks/maintenance.yml --tags wake-on-lan```

The following is an example to usue in your own playbook.

```
- hosts: all
  gather_facts: no
  roles:
    - role: bloodymage.autonomy.maintenance_wake_on_lan
      tags:
        - never
        - wakeonlan
        - wake-on-lan
```

License
-------

[MIT](../../LICENSE.md)


References
----------


Author Information
------------------

G Derber 
gd.github@bloodymage.org


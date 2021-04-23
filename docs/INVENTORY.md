# Inventory

## Inventory Heirarchy:
### dmz_zone
### internal_zone
### certificate_authorities
### mariadb_servers
### postgresql_servers
### bind9_servers
### nfs_servers
### samba_file_servers
### gitolite_servers
### gitlab_servers
### ha_proxy_servers
### keycloak_servers
### ldap_servers
### openldap_servers
### luks
### dovecot_servers
### postfix_servers
### freeradius_servers
### samba_domain_controllers
### samba_file_servers
### samba_ownca_user_hosts
### samba_workstations
### sssd
### windows_workstations
### syslog_servers
### apache_servers
### nginx_servers
### workstations

## Inventory Group description
### apache_servers
### bind9_servers
### certificate_authorities
### db_servers
### dmz_zone
### dns_servers
### dovecot_servers
### file_servers
### freeradius_servers
### git_servers
### gitlab_servers
### gitolite_servers
### ha_proxy_servers
### imap_servers
### internal_zone
### keycloak_servers
### ldap_servers
### luks
### mail_servers
### mariadb
### mysql_compatable_servers
### nfs_servers
### nginx_servers
### openldap_servers
### postfix_servers
### postgresql_servers
### radius_servers
### samba_domain
### samba_domain_controllers
### samba_file_servers
### samba_ownca_user_hosts
### samba_workstations
### smtp_servers
### sssd
### syslog_servers
### webservers
### workstations

# Directory Structure
```
inventory/
  group_vars/
    all/
  host_vars/
    www.internal.example.com/
      www.internal.example.com.yml
  hosts.yml
```

# Example host definitons
```
ansible_host: 192.168.1.1
ansible_user: pi
```

# Example Inventory
```
internal_zone:
  hosts:
    auth.internal.example.com:
    db1.internal.example.com:
    db2.internal.example.com:
    db3.internal.example.com:
    dc1.internal.example.com:
    dc2.internal.example.com:
    dlna.internal.example.com:
    fs1.internal.example.com:
    home.internal.example.com:
    mail.internal.example.com:
    mqtt.internal.example.com:
    radius.internal.example.com:
    router.internal.example.com:
    switch.internal.example.com:
    syslog.internal.example.com:
    vpn.internal.example.com:
    wap1.internal.example.com:
    wap2.internal.example.com:
    wap3.internal.example.com:
    wap4.internal.example.com:
    wifi.internal.example.com:
    windows_workstation1.internal.example.com:
    windows_workstation2.internal.example.com:
    workstation1.internal.example.com:
    workstation2.internal.example.com:
    workstation3.internal.example.com:
    www.internal.example.com:
    xen_dom0.internal.example.com:

dmz_zone:
  hosts:
    cloud.dmz.example.com:
    router.dmz.example.com:
    mail.dmz.example.com:
    ldap.dmz.example.com:
    mqtt.dmz.example.com:
    www.dmz.example.com:
    git.dmz.example.com:
    ns1.dmz.example.com:
    ns2.dmz.example.com:
    db1.dmz.example.com:
    auth.dmz.example.com:

public_zone:
  hosts:
    auth.example.com:
    db.example.com:
    git.example.com:
    mail.example.com:
    mqtt.example.com:
    ns1.example.com:
    ns2.example.com:
    www.example.com:

certificate_authorities:
  hosts:
    localhost:

routers:
  hosts:
    router.internal.example.com:
  children:
    mikrotik_routers:
      hosts:
        router.dmz.example.com:

sssd:
  hosts:
    workstation1.internal.example.com:
    mail.internal.example.com:
    www.internal.example.com:
    auth.internal.example.com:

switches:
  hosts:
    switch1.internal.example.com:

wifi_access_points:
  children:
    tpeap:
      hosts:
        wap1.internal.example.com:
        wap2.internal.example.com:

keycloak_servers:
  hosts:
    auth.internal.example.com:
    auth.dmz.example.com:
    #auth.example.com:

mariadb_servers:
  hosts:
    db1.internal.example.com:
    db2.internal.example.com:
    db3.internal.example.com:
    db1.dmz.example.com:
    db.example.com:

minidlna_servers:
  hosts:
    dlna.internal.example.com:

bind9_servers:
  hosts:
    dc1.internal.example.com:
    dc2.internal.example.com:
    ns1.dmz.example.com:
    ns2.dmz.example.com:
    ns1.example.com:
    ns2.example.com:

file_servers:
  children:
    nfs_file_servers:
      hosts:
        fs1.internal.example.com:
    samba_file_servers:
      hosts:
        fs1.internal.example.com:

git_servers:
  children:
    gitolite_servers:
      hosts:
        liberty.dmz.example.com:
        git.example.com:

ha_proxy:
  hosts:
    demeter.internal.example.com:

homeassistant:
  hosts:
    home.internal.example.com:

keytabs:
  hosts:
    dc1.internal.example.com:
    auth.internal.example.com:
    auth.dmz.example.com:
    www.internal.example.com:
    mail.internal.example.com:

ldap_servers:
  children:
    openldap_servers:
      hosts:
        ldap.internal.example.com:
        ldap.dmz.example.com:

dovecot_servers:
  hosts:
    mail.internal.example.com:

postfix_servers:
  hosts:
    mail.internal.example.com:
    mail.dmz.example.com:

mosquitto_servers:
  children:
    eclipse_mosquitto_servers:
      hosts:
        mqtt.internal.example.com:
        mqtt.dmz.example.com:

freeradius_servers:
  hosts:
    radius.internal.example.com:

redis_servers:
  hosts:
    www.dmz.example.com:
    www.internal.example.com:

samba_servers:
  children:
    samba_domain:
      children:
        samba_domain_controllers:
          hosts:
            zeus.internal.example.com:
            hera.internal.example.com:
        samba_dotfiles:
          hosts:
            aphrodite.internal.example.com:
            atlas.internal.example.com:
        samba_file_servers:
        samba_ownca_user_hosts:
          hosts:
            aphrodite.internal.example.com:
        sssd:

nextcloud_servers:
  hosts:
    cloud.example.com:
    
mediawiki_servers:
  hosts:
    wiki.internal.example.com:

apache_servers:
  mail.example.com:
  www.internal.example.com:
  www.dmz.example.com:
  mail.dmz.example.com:
  www.dmz.example.com:
  
nginx_servers:
  hosts:
    home.internal.example.com:
    git.dmz.example.com:
    mqtt.dmz.example.com:
    mqtt.example.com:
    git.example.com:

xen_servers:
  hosts:
    morpheus.internal.example.com:

workstations:
  children:
    mythfrontend:
  hosts:
    atlas.internal.example.com:
    #athena.internal.example.com:
    #hermes.internal.example.com:
```

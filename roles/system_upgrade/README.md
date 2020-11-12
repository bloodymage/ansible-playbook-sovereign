# Bootstrap Role

The purpose of the bootstrap role is to ensure that any required libraries for ansible to work on the host machine are installed.

# Tasks
## Ansible
Install ansible repo to ensure ansible is the most up to date available.

Note: Install from Pip and remove original install?
## Python
### Check if Python is installed on the Host Machine
### If Python is not installed
Install python3 and link /usr/bin/python to /usr/bin/python3
### If Python is installed, but link /usr/bin/python does not exist
Check if python version installed is 2 or 3.  If python3 link to /usr/bin/python3 else link to /usr/bin/python2


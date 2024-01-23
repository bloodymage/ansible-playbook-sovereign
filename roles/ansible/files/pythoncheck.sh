#!/bin/bash

python_bin=/usr/bin/python
python3_bin=/usr/bin/python3
#python2_bin=/usr/bin/python2

distro=$(lsb_release -i -s)

if [[ ! -x ${python_bin} ]]; then
    if [[ -x ${python3_bin} ]]; then
        echo "linking"
        ln -s ${python3_bin} ${python_bin}
    else
        case $distro in
            Debian|Ubuntu)
                echo "Installing"
                apt install python3
                [[ ! -x ${python_bin} ]] && ln -s ${python3_bin} ${python_bin}
                ;;
        esac
    fi
fi

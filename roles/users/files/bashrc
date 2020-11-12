#!/bin/bash
# ======================================================================
# bashrc ---
#
# Filename: bashrc
# Description:
# Author: Geoff S Derber
# Maintainer:
# Created: Sun Jan  6 12:22:35 2019 (-0500)
# Version:
# Package-Requires: ()
# Last-Updated: Sun Jun  9 14:50:12 2019 (-0400)
#           By: Geoff S Derber
#     Update #: 2
# URL:
# Doc URL:
# Keywords:
# Compatibility:
#
#

# Commentary:
#
#
#
#

# Change Log:
#
#
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
#
#

# Code:



# =============================================================== #
#
# PERSONAL $HOME/.bashrc FILE
#
# Last modified: Tue Mar 26 2016
#
# Code from:
#
#
# Others...
#
# =============================================================== #

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

so() { [ -s $1 ] && source $1; }

# Host Specific settings
so ~/.bash/${HOSTNAME}_settings
so ~/.bash/bashrc # main configuration

## Uses:
export ENV_NAME=$(uname -s|tr 'A-Z' 'a-z')
so ~/.bash/${ENV_NAME}_profile # configuration per OS linux/OSX/WIN
so ~/.bash/common              # common stuff or overriding
so ~/.bash/exports             # Exports
so ~/.bash/shopt               # Shopts

### Interactive ### {{{
if [[ $- == *i* ]]; then
    so ~/.bash/colors
    so ~/.bash/commonfunctions          # Common Functions
    so ~/.bash/functions                # Functions
    so ~/.bash/prompt                   # COMMAND_PROMPT function
    so ~/.bash/aliases                  # Alias
    so ~/.bash/agent                    # GPG and SSH agents, have before settings

    # Conditional functions
    # Functions requiring sudo, which you may not have access to.
    #if sudo -v ; then
    #   so ~/.bash/sudo_functions
    #fi
    # These functions are only useful for laptops
    if [[ ${LAPTOP} == "true" ]]; then
        so ~/.bash/laptop_functions
    fi
    # so ~/.bash/xdisplay
fi
### End Interactive ### }}}

## This needs to be after Interactive, to override
so ~/.bash/settings                     # Machine dependent settings

## This is last, so it can override everything. Less fighting with mini installs.
so ~/.bash/bashrc.local            # machine specific config. not tracked

#
# bashrc ends here

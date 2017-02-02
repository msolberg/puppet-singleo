# singleo

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with singleo](#setup)
    * [What singleo affects](#what-singleo-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with singleo](#beginning-with-singleo)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This provides roles which install OpenStack using the profiles from
the TripleO project. It's called SingleO because it uses the same
configurations without deploying an undercloud and using Heat.

## Module Description

The following roles are currently defined in the project:

* [all-in-one](manifests/role/all_in_one.pp): Deploys OpenStack on a single node with database, messaging, controller, and compute functions

The module is designed to be used in the following ways:

1. Using ```puppet apply```. You should be able to pull this module
down locally onto a machine and apply it.
2. From a puppet master. You should be able to pull this module down
onto a puppet master and push it out.

## Setup

### What singleo affects

This module doesn't expose classes which are designed to be used in
other modules. Instead, it presents roles which are meant to be
assigned to machines in your environment. Information on roles and profiles in Puppet is here:

https://docs.puppet.com/pe/2016.5/r_n_p_intro.html

### Setup Requirements

Unlike TripleO, which installs images onto bare metal using Ironic,
SingleO expects that your systems are already configured from an
operating system and networking standpoint. SingleO currently supports
RHEL 7.

### Beginning with singleo

## Usage

Steps to install an all-in-one environment using singleo on a RHEL 7 box:

```
# subscription-manager register
# subscription-manager list --available
# subscription-manager attach --pool=<poolid>
# subscription-manager repos --disable=*
# subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms --enable=rhel-ha-for-rhel-7-server-rpms --enable=rhel-7-server-openstack-10-rpms
# yum update -y 
# reboot
# yum install openstack-puppet-modules openstack-selinux -y
# puppet config set modulepath /etc/puppet/modules:/usr/share/puppet/modules:/usr/share/openstack-puppet/modules/
# yum install -y git
# cd /etc/puppet/modules/
# git clone https://github.com/msolberg/puppet-singleo singleo
# cat >> /etc/puppet/hiera.yaml <<EOF
---
:backends:
  - json
  - yaml
:json:
  :datadir: /etc/puppet/hieradata
:yaml:
  :datadir: /etc/puppet/hieradata
:hierarchy:
  - controller
  - common
EOF
# mkdir /etc/puppet/hieradata
# cp /etc/puppet/modules/singleo/data/* /etc/puppet/hieradata/
# puppet apply /etc/puppet/modules/singleo/manifests/role/all_in_one.pp
```

## Reference

## Limitations

This module is currently only tested on RHEL and CentOS.

## Development

## Release Notes/Contributors/Etc **Optional**

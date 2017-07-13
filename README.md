What?
=====

Opinionated Ansible Playbooks and helper scripts for installing OpenStack Keystone, Glance, Nova, Neutron, Ceilometer stable (ocata at the moment) versions in a virtualenv.

Why?
====

After the 26. time manually installing and configuring different OpenStack components it somewhat gets tedious.

How?
====

Modify `environment.yaml`, also maybe `paths.yaml`, and run the desired playbook, e.g. for installing keystone:

    $ ansible-playbook install-keystone.yaml

What?
=====

Opinionated Ansible Playbooks and helper scripts for installing OpenStack Keystone, Glance, Nova, Neutron, Ceilometer kilo/stable versions in a virtualenv.

Why?
====

After the 26. time manually installing and configuring different OpenStack components it somewhat gets tedious.

How?
====

Modify `path_vars.yaml` and `credential_params.yaml` and run the desired playbook, e.g. for installing Keystone

    $ ansible-playbook install-keystone.yaml

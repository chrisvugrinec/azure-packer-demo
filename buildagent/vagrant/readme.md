#Buildagent - dockerfile

This vagrant file creates a local buildagent that connect to your devops project
In order to get this working you need to do the following:

- Have a machine that supports VirtualBox
- Have a machine with Vagrant installed
- Have a machine that has ansible installed
- Have a PAT for your DEVOPS, make sure you give the proper AUTHERIZATION (for eg ...build and AGENT)
- Make sure you configured an agent pool named: vagrant-buildagents
- Fill in the values of your devops project in the ansible config: provisioning/ansible-cfg.yml
  - devops_organization: dude-projects
  - devops_pat: nals773ofa_EXAMPLE_XXXXX
  - timezone: Australia/Sydney
- Copy your .kube/config file or the one which contains your desired context certs to the provisioning directory

Once the machine has been provisioned, you can ssh into it, with the following command:
- vagrant ssh

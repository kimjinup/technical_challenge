#!/bin/sh
sudo puppet module install puppetlabs-vcsrepo
sudo puppet apply manifests/nodes.pp --modulepath=./modules:/etc/puppet/modules:$HOME/.puppet/modules $*

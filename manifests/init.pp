# Class: base
# ===========================
#
# Full description of class base here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'base':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class base {
  class { '::ntp':
    servers => ['time01.samdom.aussieswithtails.fuzzbutt'],
  }

  class { '::ssh':
    permit_root_login                => 'no',
    sshd_config_allowusers           => ['administrator',],
    sshd_ignorerhosts                => 'yes',
    ssh_config_server_alive_interval => 300,
    sshd_config_loglevel             => 'ERROR',
    sshd_config_hostkey              => ['/etc/ssh/ssh_host_rsa_key', '/etc/ssh/ssh_host_dsa_key'],
    service_ensure                   => running,
    service_enable                   => true,
  }

  ::base::user { 'administrator':
    gid         => '1000',
    home        => "/home/administrator",
    id          => 'administrator',
    passwd      => '9073guss',
    realname    => 'Administrator Account',
    shell       => '/usr/bin/zsh',
    state       => present,
    sgroups     => [],
    uid         => '1000',
  }
}

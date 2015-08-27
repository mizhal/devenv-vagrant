group { "ruby":
  ensure => present,
  gid => 666
}
group { "rvm":
  ensure => present,
  gid => 667
}
user { "deploy":
  ensure => "present",
  managehome => true,
  shell => "/bin/bash",
  groups => ["rvm", "ruby"]
}
user { "rubyserver":
  ensure => "present",
  managehome => true,
  shell => "/bin/bash",
  groups => ["rvm", "ruby"]
}
user { "nodeserver":
  ensure => "present",
  managehome => true
}

include git

class { 'nginx': }
class { 'nodejs':
  repo_url_suffix => 'node_0.12'
}
class { '::rvm': }
rvm::system_user {rubyserver: ; deploy: ;}
# https://forge.puppetlabs.com/stankevich/python
class { 'python' :
  version    => 'system',
  pip        => true,
  dev        => true,
  virtualenv => true,
  gunicorn   => true,
}
rvm_system_ruby {
  'ruby-1.8.7-p334':
    ensure      => 'present',
    default_use => false;
  'ruby-1.9.3':
    ensure      => 'present',
    default_use => false;
  'ruby-2.0':
    ensure      => 'present',
    default_use => true;
}
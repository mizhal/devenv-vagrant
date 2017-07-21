group { "ruby":
  ensure => present,
  gid => 666
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
rvm::system_user {rubyserver: ; deploy: ; vagrant: ;}
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
  'ruby-2.3.1':
    ensure      => 'present',
    default_use => true;
  'ruby-2.4.1':
    ensure      => 'present',
    default_use => false;
}

rvm_gemset {
  'ruby-1.8.7-p334@starter':
    ensure  => present,
    require => Rvm_system_ruby['ruby-1.8.7-p334'];
  'ruby-1.9.3@starter':
    ensure  => present,
    require => Rvm_system_ruby['ruby-1.9.3'];
  'ruby-2.3.1@starter':
    ensure  => present,
    require => Rvm_system_ruby['ruby-2.3.1'];
  'ruby-2.3.1@starter-2':
    ensure  => present,
    require => Rvm_system_ruby['ruby-2.3.1'];
  'ruby-2.4.1@starter':
    ensure => present,
    require => Rvm_system_ruby['ruby-2.4.1'];
}

rvm_gem {
  'rails-2.3.8':
    name         => 'rails',
    ruby_version => 'ruby-1.8.7-p334',
    ensure       => '2.3.8',
    require      => Rvm_system_ruby['ruby-1.8.7-p334'];
  'rails-3.2.22':
    name         => 'rails',
    ruby_version => 'ruby-1.9.3',
    ensure       => '3.2.22',
    require      => Rvm_system_ruby['ruby-1.9.3'];
  'ruby-2.3.1@starter-2/rails':
    ensure       => '4.1.15',
    require      => Rvm_gemset['ruby-2.3.1@starter-2'];    
  'ruby-2.3.1@starter/rails':
    ensure       => '4.2.6',
    require      => Rvm_gemset['ruby-2.3.1@starter'];
  'ruby-2.3.1/rails':
    ensure       => '4.2.6',
    require      => Rvm_system_ruby['ruby-2.3.1'];
  'ruby-2.4.1/rails':
    ensure       => '5.1.2',
    require      => Rvm_system_ruby['ruby-2.4.1'];
}

class { 'redis':; }
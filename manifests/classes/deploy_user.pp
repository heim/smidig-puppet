class deploy_user {
  group { 'deploy': ensure => present, gid => 1337 } 
  file { '/server':
    ensure => directory,
  }
  user { 'bekkopen': 
    ensure => present,
    password => 'smidig2011',
    uid => 1337,
    gid => 1337,
    shell   => "/bin/bash",
    home    => "/server/bekkopen",
    managehome => true,
    require => File["/server"],
  }
}
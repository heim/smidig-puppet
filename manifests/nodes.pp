node basenode {
  Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }
}

node "node2.morisbak.net" inherits basenode {
  include postfix
  
  package { 'mailutils': 
    ensure => latest,
  }
  
  package { 'openjdk-7-jre': 
    ensure => latest,
  }

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

node "node1.morisbak.net" inherits basenode {
  

  $mysql_password = "w00t"

  include jenkins
  include nexus
  include mysql::server
}
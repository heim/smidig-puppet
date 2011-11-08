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
  
  ssh_authorized_key { 'stein':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo114ixCPpMS66KVIsj+wEKyjpNSIh48abP8bAK73JHFNVqyJn1kz015oyoc0NZJn7pd318evAlYF82Vu25cpJK7rFL+2QvI/asgrj0XmwV3DUuqWlieV6DR6XdWHJYUPvs+mPftX23ctmbIO7JfUPZ+pD5ixCdcvAQYFTu6ofwSP51sR7JXv3fxoHhfS03u65893IIjm8ct/tHwBBM76q1ln4TIMIUWFgFFDjoUwWbve8nXBpF0iwVJk93Owde19tDfaLj0cbCVIjkTHbTi9z9N68vBZbGzZLDKDZB6C72/4WOD7JhQ51jBkrufNCQTIagGC5OF7/EMdJRgQ9rNUVw== stein@mac-stimori.local",
    user => root,
    
  }

  $mysql_password = "w00t"

  include jenkins
  include nexus
  include mysql::server
}
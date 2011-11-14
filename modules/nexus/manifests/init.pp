class nexus {

  $nexus_bundle = "/tmp/nexus-oss-webapp-1.9.2.3-bundle.tar.gz"

  file {$nexus_bundle:
    ensure => present,
    require => Exec["Fetch nexus"],
  }

  exec { "Fetch nexus":
    cwd => "/tmp",
    command => "wget 'http://nexus.sonatype.org/downloads/nexus-oss-webapp-1.9.2.3-bundle.tar.gz'",
    creates => $nexus_bundle,
    path    => ["/usr/bin", "/bin"],
  }

  file { "/opt/nexus-oss-webapp-1.9.2.3":
    require => Exec["Extract nexus"],
  }

  exec { "Extract nexus":
    cwd     => "/opt",
    command => "tar xvf $nexus_bundle",
    creates => '/opt/nexus-oss-webapp-1.9.2.3',
    path    => ["/usr/bin", "/bin"],
    require => File[$nexus_bundle]
  }

  file { "/opt/nexus":
    ensure  => link,
    target  => "/opt/nexus-oss-webapp-1.9.2.3",
    require => File['/opt/nexus-oss-webapp-1.9.2.3'],
  }

  file { "/etc/init.d/nexus":
    ensure  => link,
    target  => "/opt/nexus/bin/jsw/linux-x86-32/nexus",
    require => File['/opt/nexus'],
  }

  package { 'openjdk-6-jre': 
    ensure => latest,
  }

  service { 'nexus': 
    enable  => true, 
    ensure => running,
    name => "nexus",
    path => "/etc/init.d/",
    hasstatus => true,
    require => [File['/etc/init.d/nexus'], Package['openjdk-7-jre']]
  }

}
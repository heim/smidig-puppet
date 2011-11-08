class jenkins {

    $key_url = "http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key"
    $repo_url = "deb http://pkg.jenkins-ci.org/debian binary/"
    $apt_sources = "/etc/apt/sources.list"

    exec { "install jenkins key":
        command     => "wget -q -O - ${key_url} | apt-key add -; echo '${repo_url}' >> ${apt_sources}",
        onlyif      => "grep -Fvxq '${repo_url}' ${apt_sources}",
        path        => ["/bin", "/usr/bin"],
    }

    exec { "jenkins-apt-update":
        command => "/usr/bin/aptitude -y update",
        require => Exec["install jenkins key"],
    }

    package { "jenkins":
        ensure      => present,
        provider    => "aptitude",
        require     => Exec["jenkins-apt-update"],
    }

    service { "jenkins":
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => true,
        require     => Package["jenkins"],
    }
    
    file { '/etc/default/jenkins':
       ensure => present,
       mode   => 644,
       owner  => 'root',
       source => "puppet:///modules/jenkins/jenkins",
     }

}

define install-jenkins-plugin($name, $version=0) {
  $plugin     = "${name}.hpi"
  $plugin_dir = "/var/lib/jenkins/plugins"

  if ($version != 0) {
    $base_url = "http://updates.jenkins-ci.org/download/plugins/${name}/${version}/"
  }
  else {
    $base_url   = "http://updates.jenkins-ci.org/latest/"
  }

  if (!defined(File["${plugin_dir}"])) {
    file {
      "${plugin_dir}" :
        owner  => "jenkins",
        ensure => directory,
    }
  }

  if (!defined(User["jenkins"])) {
    user {
      "jenkins" :
        ensure => present;
    }
  }

  exec {
    "download-${name}" :
      command  => "wget --no-check-certificate ${base_url}${plugin}",
      cwd      => "${plugin_dir}",
      require  => File["${plugin_dir}"],
      path     => ["/usr/bin", "/usr/sbin",],
      user     => "jenkins",
      unless   => "test -f ${plugin_dir}/${plugin}",
      #notify => Service["jenkins"],
  }
}

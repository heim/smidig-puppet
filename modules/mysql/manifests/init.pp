
class mysql::client {
  package { 'mysql-client':
    ensure  => installed,
  }
}


class mysql::server {
  include mysql::client

  package { 'mysql-server':
    ensure  => installed,
  }

  service { 'mysql':
    enable => true,
    ensure => running, 
    hasrestart => true,
    hasstatus => true,
    require => Package['mysql-server'],
  }
  
  exec { "set-mysql-password":
      unless => "mysqladmin -uroot -p$mysql_password status",
      path => ["/bin", "/usr/bin"],
      command => "mysqladmin -uroot password $mysql_password",
      require => Service["mysql"],
  }

}
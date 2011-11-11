class environment_variables {
  file { '/etc/environment':
     ensure => present,
     mode   => 644,
     owner  => 'root',
     source => 'puppet:///modules/environment-variables/environment',
   }
  
}

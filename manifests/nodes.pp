node basenode {
  Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }
  
  ssh_authorized_key { 'stein-mbp':
     ensure => present,
     key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo114ixCPpMS66KVIsj+wEKyjpNSIh48abP8bAK73JHFNVqyJn1kz015oyoc0NZJn7pd318evAlYF82Vu25cpJK7rFL+2QvI/asgrj0XmwV3DUuqWlieV6DR6XdWHJYUPvs+mPftX23ctmbIO7JfUPZ+pD5ixCdcvAQYFTu6ofwSP51sR7JXv3fxoHhfS03u65893IIjm8ct/tHwBBM76q1ln4TIMIUWFgFFDjoUwWbve8nXBpF0iwVJk93Owde19tDfaLj0cbCVIjkTHbTi9z9N68vBZbGzZLDKDZB6C72/4WOD7JhQ51jBkrufNCQTIagGC5OF7/EMdJRgQ9rNUVw== stein@mac-stimori.local",
     user => root,
     type => rsa,
  }
  
  ssh_authorized_key { 'stein-imac':
   ensure => present,
   key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDf8uyjg1vjAlrHoOJcBsPm+L7OO/8DPJRtZS0YvnES8ngTVv0kCZsHMl/PdJcx9Y1MQctBwKDOeNhOHKJs+PCH5f7AyxluGG+2NgcOpmNlSnQiPMLSDG8g7jVocOzd2LaOhv4W+Z2ofV4EHsjeM/wzLcFwKYHPfwixOK13SCOnlLzHUmFAKwxn6ViQ90qannh15BjyLgO/N+W28UJxuzJ78kcAr5i0r0JJHE22h4uCD7D0hqeit+slxfsyp47cPi/bY1U1hUpbOumzZ4va35U95PGViKNwXbrfdIwcjuCOH67tS6jxdV2z5RdwLB2F5MlJPcGaLNUIW3XNs/4UK38d stein@Steins-iMac.local",
   user => root,
   type => rsa,
  }
  
   ssh_authorized_key { 'andreas':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAoSHTWKHH264+aHCu6tmlcx0ToEC1fRGmFo4+lo1JYjXe0D3hp7LMoWU++0Q7FlhiswjHjO3vLKdxWpvDAEaKc7JV705ewVZgbs2rtUGplxoc9WrrrdUhmQPERMhyCdnxyUigjRmhrqcyO2xAdKYdrTHB3YVjC0Mr00oKNdVyWHgNEtGQztNIOCsFMKq73K0tzbFY+HiMW7L4YMPOJAYreiQMyNjYhzjCsprHYyT3HCW6mjHTurGzHUxbrZo/KOR/SEJiagjVjA/Kb4e4qNQh2S98Lht2qqldWUFfMgzsuzu49Q9LSBY/HTc0IrxG2oxxUWuZFgaAZ/CmrERYtRdWdQ== andreas heim@heims.local",
    user => root,
    type => rsa,
  }
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

node "node3.morisbak.net" inherits basenode {
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
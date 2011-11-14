class users {}

class users::admins inherits users { 
  ssh_authorized_key { 'stein@mac-stimori.local':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo114ixCPpMS66KVIsj+wEKyjpNSIh48abP8bAK73JHFNVqyJn1kz015oyoc0NZJn7pd318evAlYF82Vu25cpJK7rFL+2QvI/asgrj0XmwV3DUuqWlieV6DR6XdWHJYUPvs+mPftX23ctmbIO7JfUPZ+pD5ixCdcvAQYFTu6ofwSP51sR7JXv3fxoHhfS03u65893IIjm8ct/tHwBBM76q1ln4TIMIUWFgFFDjoUwWbve8nXBpF0iwVJk93Owde19tDfaLj0cbCVIjkTHbTi9z9N68vBZbGzZLDKDZB6C72/4WOD7JhQ51jBkrufNCQTIagGC5OF7/EMdJRgQ9rNUVw==",
    user => root,
    type => rsa,
  }

  ssh_authorized_key { 'stein@Steins-iMac.local':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDf8uyjg1vjAlrHoOJcBsPm+L7OO/8DPJRtZS0YvnES8ngTVv0kCZsHMl/PdJcx9Y1MQctBwKDOeNhOHKJs+PCH5f7AyxluGG+2NgcOpmNlSnQiPMLSDG8g7jVocOzd2LaOhv4W+Z2ofV4EHsjeM/wzLcFwKYHPfwixOK13SCOnlLzHUmFAKwxn6ViQ90qannh15BjyLgO/N+W28UJxuzJ78kcAr5i0r0JJHE22h4uCD7D0hqeit+slxfsyp47cPi/bY1U1hUpbOumzZ4va35U95PGViKNwXbrfdIwcjuCOH67tS6jxdV2z5RdwLB2F5MlJPcGaLNUIW3XNs/4UK38d",
    user => root,
    type => rsa,
  }

  ssh_authorized_key { 'andreas heim@heims.local':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAoSHTWKHH264+aHCu6tmlcx0ToEC1fRGmFo4+lo1JYjXe0D3hp7LMoWU++0Q7FlhiswjHjO3vLKdxWpvDAEaKc7JV705ewVZgbs2rtUGplxoc9WrrrdUhmQPERMhyCdnxyUigjRmhrqcyO2xAdKYdrTHB3YVjC0Mr00oKNdVyWHgNEtGQztNIOCsFMKq73K0tzbFY+HiMW7L4YMPOJAYreiQMyNjYhzjCsprHYyT3HCW6mjHTurGzHUxbrZo/KOR/SEJiagjVjA/Kb4e4qNQh2S98Lht2qqldWUFfMgzsuzu49Q9LSBY/HTc0IrxG2oxxUWuZFgaAZ/CmrERYtRdWdQ==",
    user => root,
    type => rsa,
  }

}

class users::deployer inherits users {
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

class users::deployer::admins inherits users::deployer {
  
  ssh_authorized_key { 'stein@mac-stimori.local2':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo114ixCPpMS66KVIsj+wEKyjpNSIh48abP8bAK73JHFNVqyJn1kz015oyoc0NZJn7pd318evAlYF82Vu25cpJK7rFL+2QvI/asgrj0XmwV3DUuqWlieV6DR6XdWHJYUPvs+mPftX23ctmbIO7JfUPZ+pD5ixCdcvAQYFTu6ofwSP51sR7JXv3fxoHhfS03u65893IIjm8ct/tHwBBM76q1ln4TIMIUWFgFFDjoUwWbve8nXBpF0iwVJk93Owde19tDfaLj0cbCVIjkTHbTi9z9N68vBZbGzZLDKDZB6C72/4WOD7JhQ51jBkrufNCQTIagGC5OF7/EMdJRgQ9rNUVw==",
    user => bekkopen,
    type => rsa,
    require => File['/server/bekkopen/.ssh'],
  }

  ssh_authorized_key { 'stein@Steins-iMac.local2':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDf8uyjg1vjAlrHoOJcBsPm+L7OO/8DPJRtZS0YvnES8ngTVv0kCZsHMl/PdJcx9Y1MQctBwKDOeNhOHKJs+PCH5f7AyxluGG+2NgcOpmNlSnQiPMLSDG8g7jVocOzd2LaOhv4W+Z2ofV4EHsjeM/wzLcFwKYHPfwixOK13SCOnlLzHUmFAKwxn6ViQ90qannh15BjyLgO/N+W28UJxuzJ78kcAr5i0r0JJHE22h4uCD7D0hqeit+slxfsyp47cPi/bY1U1hUpbOumzZ4va35U95PGViKNwXbrfdIwcjuCOH67tS6jxdV2z5RdwLB2F5MlJPcGaLNUIW3XNs/4UK38d",
    user => bekkopen,
    type => rsa,
    require => File['/server/bekkopen/.ssh'],
  }

  ssh_authorized_key { 'andreas heim@heims.local2':
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAoSHTWKHH264+aHCu6tmlcx0ToEC1fRGmFo4+lo1JYjXe0D3hp7LMoWU++0Q7FlhiswjHjO3vLKdxWpvDAEaKc7JV705ewVZgbs2rtUGplxoc9WrrrdUhmQPERMhyCdnxyUigjRmhrqcyO2xAdKYdrTHB3YVjC0Mr00oKNdVyWHgNEtGQztNIOCsFMKq73K0tzbFY+HiMW7L4YMPOJAYreiQMyNjYhzjCsprHYyT3HCW6mjHTurGzHUxbrZo/KOR/SEJiagjVjA/Kb4e4qNQh2S98Lht2qqldWUFfMgzsuzu49Q9LSBY/HTc0IrxG2oxxUWuZFgaAZ/CmrERYtRdWdQ==",
    user => bekkopen,
    type => rsa,
    require => File['/server/bekkopen/.ssh']
  }
  
  ssh_authorized_key { 'jenkins@node1.morisbak.net': 
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAtwwUodtSCKMCu7peFED+VRKPwB0VpRrReZA5KO4Pnap2a1k3nEyEomoe8QgVD1RPCHB1OCOrED1a+dNzvyOkIA6xE7IKlfefUE0M5gvFhHP7Ah6BFvWg2ZmePVgIj/BVtlvvzhdlg+SFPoZCu8cbRdpJlKkXoP7O9Z207Zg3AOQXGblGopSXdeXCBdANy6bA9N2qdjXJ6ep/6EGFW1otXIA7WwxLAkuL6Q/V88ywwuxAh54FQjikukfaoEwWdWH27clSj6dlkez3lzkkwCVcCJ8fXuociQUDMb3KPoaX6yrvh6rAixhUmTMzXpRinuxgyYZfQ8iUPmDGhnY+HPtusw==",
    user => bekkopen,
    type => rsa,
    require => File['/server/bekkopen/.ssh'],
  }
  
  file { '/server/bekkopen/.ssh':
    ensure => directory,
    owner => bekkopen,
  }
}
class mysql::user inherits mysql::server {
  exec { "bekkopen_user":
       unless => "/usr/bin/mysql -ubekkopen -phemmelig",
       command => "/usr/bin/mysql -uroot -p$mysql_password -e \"CREATE USER 'bekkopen'@'localhost' IDENTIFIED BY 'hemmelig'; GRANT ALL PRIVILEGES ON *.* TO 'bekkopen'@'localhost' IDENTIFIED BY 'hemmelig' WITH GRANT OPTION; CREATE USER 'bekkopen'@'%' IDENTIFIED BY 'hemmelig'; GRANT ALL PRIVILEGES ON *.* TO 'bekkopen'@'%' IDENTIFIED BY 'hemmelig' WITH GRANT OPTION;\"",
       require => [Service["mysql"], Exec['set-mysql-password']],
       
  }
  
}


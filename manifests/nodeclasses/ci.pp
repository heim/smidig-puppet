class ci inherits base {
  $mysql_password = "w00t"
  
  include jenkins
  include nexus
  include mysql::server
  include users::admins
}


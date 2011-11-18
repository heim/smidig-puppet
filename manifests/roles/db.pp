class db inherits base {
  $mysql_password = "w00t"
  
  include mysql::server
  include mysql::user
  include users::admins
}
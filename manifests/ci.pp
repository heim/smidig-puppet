Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }


$mysql_password = "w00t"

include jenkins
include nexus
include mysql::server

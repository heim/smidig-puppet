node basenode {
  Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }
  
  include users
  
  package { "git-core":
    ensure => latest,
  }
}

node "node2.morisbak.net" inherits basenode {
  include web
  include deploy_user
}

node "node3.morisbak.net" inherits basenode {
  include web
  include deploy_user
}

node "node1.morisbak.net" inherits basenode {
  include ci  
}
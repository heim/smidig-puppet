node basenode {
  Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }
}

node "node2.morisbak.net" inherits basenode {
  include web
}

node "node3.morisbak.net" inherits basenode {
  include web
  include db
}

node "node1.morisbak.net" inherits basenode {
  include ci  
}
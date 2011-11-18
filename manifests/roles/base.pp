class base {
  include users::admins
  include javahome  
  package { "git-core":
    ensure => latest,
  }
}
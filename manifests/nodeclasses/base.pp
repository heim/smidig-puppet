class base {
  include users::admins
    
  package { "git-core":
    ensure => latest,
  }
}
class base {
  include users::admins
  include environment-variables  
  package { "git-core":
    ensure => latest,
  }
}
class base {
  include users::admins
  include environment_variables  
  package { "git-core":
    ensure => latest,
  }
}
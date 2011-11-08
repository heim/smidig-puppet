class base {
  include users
  
  package { "git-core":
    ensure => latest,
  }
}
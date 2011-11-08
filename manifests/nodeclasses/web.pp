class web inherits base {
  
  include users::deployer
  include postfix
  package { 'openjdk-7-jre': 
    ensure => latest,
  }

}

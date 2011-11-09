class web inherits base {
  
  include users::deployer
  include postfix
  package { 'openjdk-6-jre': 
    ensure => latest,
  }

}

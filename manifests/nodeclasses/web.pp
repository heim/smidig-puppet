class web inherits base {
  
  include users::deployer
  include postfix
  include zip
  include unzip
  package { 'openjdk-6-jre': 
    ensure => latest,
  }

}

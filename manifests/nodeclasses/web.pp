class web inherits base {
  
  include users::deployer
  include users::admins
  include postfix
  include mailutils
  include zip
  include unzip
  package { 'openjdk-6-jre': 
    ensure => latest,
  }

}

class web inherits base {
  
  include users::deployer
  include users::admins
  include users::deployer::admins
  include postfix
  include mailutils
  include zip
  include unzip
  package { 'openjdk-6-jre': 
    ensure => latest,
  }

}

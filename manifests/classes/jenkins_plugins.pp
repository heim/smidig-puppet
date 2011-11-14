class jenkins::plugins extends jenkins {

  
  install-jenkins-plugin {
      "git-plugin" :
          name => "git";
  }
  
  install-jenkins-plugin {
      "github-plugin" :
          name => "github";
  }
  
  install-jenkins-plugin {
      "maven2-plugin" :
          name => "maven-plugin";
  }
  
  
  install-jenkins-plugin {
      "chuck-norris-plugin" :
          name => "chucknorris";
  }
  
  
}
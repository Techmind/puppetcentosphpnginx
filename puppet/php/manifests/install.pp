# Class: php::install
#
# This class will install the packages needed to deploy php on the instance
class php::install {
  package {
    $php::package_list:
      ensure => $php::package_ensure;
    $php::package_deps:
      ensure => $php::package_ensure;
  }
}

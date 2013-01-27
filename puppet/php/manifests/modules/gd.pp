# Class: php::modules::gd
#
# This class installs and deploys the php-gd module
class php::modules::gd {
  package { $php::gd_pkg :
    ensure  => installed,
    require => Class['php'];
  }
}

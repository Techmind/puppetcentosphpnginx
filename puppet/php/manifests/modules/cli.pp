# Class: php::modules::cli
#
# This class installs and deploys the php-cli module
class php::modules::cli {
  package { $php::cli_pkg :
    ensure  => installed,
    require => Class['php'];
  }
}

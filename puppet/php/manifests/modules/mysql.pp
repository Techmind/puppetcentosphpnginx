# Class: php::modules::mysql
#
# This class installs and deploys the php-mysql module
class php::modules::mysql {
  package { $php::mysql_pkg :
    ensure  => installed,
    require => Package['mysql-server'];
  }
}

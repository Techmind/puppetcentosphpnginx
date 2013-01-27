# Class: php::modules::bcmath
#
# This class installs and deploys the php-bcmath module
class php::modules::bcmath {
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL': {
      package { $php::bcmath_pkg :
        ensure  => installed,
        require => Class['php'];
      }
    }
    'ubuntu','debian': {
      notice ('The bcmatch php module is installed by default on your')
      notice ("${::operatingsystem} distribution")
    }
    default: {
    }
  }
}

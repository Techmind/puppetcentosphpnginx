# Class: php::modules::mbstring
#
# This class installs and deploys the php-mbstring module
class php::modules::mbstring {
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL': {
      package { $php::mbstring_pkg :
        ensure  => installed,
        require => Class['php'];
      }
    }
    'ubuntu','debian': {
      notice ( 'The mbstring php module is installed by default on your')
      notice ( "${::operatingsystem} distribution")
    }
    default: {
    }
  }
}

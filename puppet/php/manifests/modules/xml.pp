# Class: php::modules::xml
#
# This class installs and deploys the php-xml module
class php::modules::xml {
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL': {
      package { $php::xml_pkg :
        ensure  => installed,
        require => Class['php'];
      }
    }
    'ubuntu','debian': {
      notice ('The xml php module is installed by default on your')
      notice ("${::operatingsystem} distribution")
    }
    default: {
    }
  }
}

# Class: php::modules::apc
#
# This class installs and deploys the php-apc module
class php::modules::apc {
  package { $php::apc_pkg :
        ensure  => installed,
  }
  augeas {'php.ini-apc':
    notify   => Service[$php::webserver],
    require  => Package[$php::package_list],
    context  => "/files/etc/${php::php_ini}/PHP/",
    changes  => 'set extension apc.so';
  }
  if $php::apc_progressbar {
    $apc_num = 1
  } else {
    $apc_num = 0
  }
  augeas {'php.ini-apc-progressbar':
    notify   => Service[$php::webserver],
    require  => Package[$php::package_list],
    context  => "/files/etc/${php::php_ini}/PHP/",
    changes  => "set apc.rfc1867 ${apc_num}";
  }
}

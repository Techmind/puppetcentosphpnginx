# Class: php::modules::log
#
# This class enables php-logging
class php::modules::log {
  augeas {'php.ini-logging':
    notify   => Service[$php::webserver],
    require  => Package[$php::package_list],
    context  => "/files/etc/${php::php_ini}/PHP/",
    changes  => "set error_log ${php::php_error_log}";
  }
}

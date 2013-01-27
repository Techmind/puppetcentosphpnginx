# Class: php::config
#
# This class will configure the php instance
class php::config {
  case $php::webserver {
    'httpd', 'apache': {
      file { "${php::webserver_apache_config_dir}/php.conf":
        owner    => $php::webserver_apache_config_user,
        group    => $php::webserver_apache_config_group,
        mode     => $php::webserver_apache_config_mode,
        content  => template('php/apache.erb'),
        require  => Class['apache'];
      }
    }
    'nginx': {}
    default: {
      fail "Webserver ${php::webserver} is not supported."
    }
  }
}

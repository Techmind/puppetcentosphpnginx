# Class: php::modules::fcgi
#
# This class installs and deploys the php-fcgi module
class php::modules::fpm {
  case $php::webserver {
    'httpd': {
      notice( 'The php-puppet module isn\'t supporting configuration of the')
      notice( "fast-cgi php module on a ${php::webserver} based server yet")
    }
    'apache': {
      notice( 'The php-puppet module isn\'t supporting configuration of the')
      notice( "fast-cgi php module on a ${php::webserver} based server yet")
    }
    'nginx': {
      package { $php::fpm_pkg :
        ensure       => installed,
      }
      service { 'php-fpm':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => [
          Package[$php::fpm_pkg],
          Class[$php::webserver],
        ],
      }
      File {
        owner => 'root',
        group => 'root',
        mode  => '0751',
      }
      #file {
      #  '/etc/init.d/php-fcgi':
      #  content => template($php::fcgi_init_file);
      #  '/usr/bin/php-fastcgi':
      #  content => template($php::fcgi_bin_file);
      #}
    }
    default: {
      notice( 'The php-puppet module isn\'t suppporting your')
      notice( "${php::webserver} server yet")
    }
  }
}

# Class: php::params
#
# Declaration class of all parameters used in the php module
class php::params {
  $motd = false
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL': {
      $package_ensure = 'present'
      $package_list   = 'php'
      $package_deps   = 'php-devel'
      $modules        = []
      $webserver      = 'httpd'
      # PHP
      $php_ini        = 'php.ini'
      $php_error_log  = 'php_errors.log'
      # Apache
      $webserver_apache_name         = 'httpd'
      $webserver_apache_module       = 'apache'
      $webserver_apache_service      = 'httpd'
      $webserver_apache_service_user = 'apache'
      $webserver_apache_config_user  = 'root'
      $webserver_apache_config_group = 'root'
      $webserver_apache_config_mode  = '0644'
      $webserver_apache_config_dir   = '/etc/httpd/conf.d'
      # Nginx
      $webserver_nginx_name          = 'nginx'
      $webserver_nginx_module        = 'nginx'
      $webserver_nginx_service       = 'nginx'
      $webserver_nginx_service_user  = 'nginx'
      $webserver_nginx_config_user   = 'root'
      $webserver_nginx_config_group  = 'root'
      $webserver_nginx_config_mode   = '0644'
      $webserver_nginx_config_dir    = '/etc/nginx/conf.d'
      # Modules
      $pear_pkg                      = 'php-pear'
      $bcmath_pkg                    = 'php-bcmath'
      $gd_pkg                        = 'php-gd'
      $mbstring_pkg                  = 'php-mbstring'
      $cli_pkg                       = 'php-cli'
      $fpm_pkg			     = 'php-fpm'
      $fcgi_pkg                      = 'spawn-fcgi'
      $fcgi_init_file                = 'php/fastcgi-init-rhel.erb'
      $fcgi_bin_file                 = 'php/fastcgi-bin-rhel.erb'
      $fcgi_bindaddress              = '127.0.0.1'
      $fcgi_bindport                 = '9000'
      $fcgi_user                     = 'nginx'
      $fcgi_group                    = 'nginx'
      $fcgi_childs                   = '15'
      $mysql_pkg                     = 'php-mysql'
      $xml_pkg                       = 'php-xml'
      $apc_pkg                       = 'php-pecl-apc'
      $apc_progressbas               = false
    }
    'debian', 'ubuntu': {
      $package_ensure = 'present'
      $package_list   = 'php5'
      $package_deps   = 'php5-dev'
      $modules        = []
      $webserver      = 'httpd'
      # PHP
      $php_ini        = 'php5/apache2/php.ini'
      $php_error_log  = 'php_errors.log'
      # Apache
      $webserver_apache_name         = 'httpd'
      $webserver_apache_module       = 'apache'
      $webserver_apache_service      = 'httpd'
      $webserver_apache_service_user = 'apache'
      $webserver_apache_config_user  = 'root'
      $webserver_apache_config_group = 'root'
      $webserver_apache_config_mode  = '0644'
      $webserver_apache_config_dir   = '/etc/httpd/conf.d'
      # Nginx
      $webserver_nginx_name          = 'nginx'
      $webserver_nginx_module        = 'nginx'
      $webserver_nginx_service       = 'nginx'
      $webserver_nginx_service_user  = 'nginx'
      $webserver_nginx_config_user   = 'root'
      $webserver_nginx_config_group  = 'root'
      $webserver_nginx_config_mode   = '0644'
      $webserver_nginx_config_dir    = '/etc/nginx/conf.d'
      # Modules
      $pear_pkg                      = 'php-pear'
      $bcmath_pkg                    = ''
      $gd_pkg                        = 'php5-gd'
      $mbstring_pkg                  = ''
      $cli_pkg                       = 'php5-cli'
      $fcgi_pkg                      = 'spawn-fcgi'
      $fcgi_init_file                = 'php/fastcgi-init-debian.erb'
      $fcgi_bin_file                 = 'php/fastcgi-bin-debian.erb'
      $fcgi_bindaddress              = '127.0.0.1'
      $fcgi_bindport                 = '9000'
      $fcgi_user                     = 'www-data'
      $fcgi_group                    = 'www-data'
      $fcgi_childs                   = '15'
      $mysql_pkg                     = 'php5-mysql'
      $xml_pkg                       = ''
      $apc_pkg                       = 'php-apc'
      $apc_progressbar               = false
    }
    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

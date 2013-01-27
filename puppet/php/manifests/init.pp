# Class: php
#
# Initiatialing class to deploy php
# ****************************************************************************
# Example usage in site.pp:
# class { 'php':
#   webserver       => "nginx",
#   modules         => ['apc','bcmath','cli','fcgi','gd','log','mbstring',
#   'pear','xml'],
#   apc_progressbar => true,
#   php_error_log   => "php_errors.log";
# }
# ****************************************************************************
# All variables are declared with the default values in the params.pp manifest
# Those parameters should be overwritten in your site.pp if neccessary and not
# in the manifests of the module!
class php (
  $webserver                     = $php::params::webserver,
  $package_ensure                = $php::params::package_ensure,
  $package_list                  = $php::params::package_list,
  $package_deps                  = $php::params::package_deps,
  $modules                       = $php::params::modules,
  $php_ini                       = $php::params::php_ini,
  $php_error_log                 = $php::params::php_error_log,
  $pear_pkg                      = $php::params::pear_pkg,
  $bcmath_pkg                    = $php::params::bcmath_pkg,
  $gd_pkg                        = $php::params::gd_pkg,
  $mbstring_pkg                  = $php::params::mbstring_pkg,
  $cli_pkg                       = $php::params::cli_pkg,
  $fcgi_pkg                      = $php::params::fcgi_pkg,
  $fcgi_init_file                = $php::params::fcgi_init_file,
  $fcgi_bin_file                 = $php::params::fcgi_bin_file,
  $mysql_pkg                     = $php::params::mysql_pkg,
  $xml_pkg                       = $php::params::xml_pkg,
  $apc_pkg                       = $php::params::apc_pkg,
  $apc_progressbar               = $php::params::apc_progressbar,
  $webserver_apache_name         = $php::params::webserver_apache_name,
  $webserver_apache_service      = $php::params::webserver_apache_service,
  $webserver_apache_service_user = $php::params::webserver_apache_service_user,
  $webserver_apache_config_user  = $php::params::webserver_apache_config_user,
  $webserver_apache_config_group = $php::params::webserver_apache_config_group,
  $webserver_apache_config_mode  = $php::params::webserver_apache_config_mode,
  $webserver_apache_config_dir   = $php::params::webserver_apache_config_dir,
  $webserver_nginx_name          = $php::params::webserver_nginx_name,
  $webserver_nginx_service       = $php::params::webserver_nginx_service,
  $webserver_nginx_service_user  = $php::params::webserver_nginx_service_user,
  $webserver_nginx_config_user   = $php::params::webserver_nginx_config_user,
  $webserver_nginx_config_group  = $php::params::webserver_nginx_config_group,
  $webserver_nginx_config_mode   = $php::params::webserver_nginx_config_mode,
  $webserver_nginx_config_dir    = $php::params::webserver_nginx_config_dir,
  $motd                          = $php::params::motd
) inherits php::params {

  if $motd {
    motd::register{'php':}
  }

  include php::install
  include php::config
  include php::modules

  Class['php::install'] ->
  Class['php::config'] ->
  Class['php::modules']
}

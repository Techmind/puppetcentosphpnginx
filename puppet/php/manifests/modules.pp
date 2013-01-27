# Class: php::modules
#
# This class checks the modules to be installed as initizialized in the site.pp
class php::modules {
  if $php::modules {
    php::module{$php::modules:;}
  }
}

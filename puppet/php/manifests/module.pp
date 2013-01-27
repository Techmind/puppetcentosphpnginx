# Define php::module for the modules.pp manifest to load the initialized
# php-modules array from whitin the init.pp file
define php::module (){
  class{
    "php::modules::${name}":;
  }
}

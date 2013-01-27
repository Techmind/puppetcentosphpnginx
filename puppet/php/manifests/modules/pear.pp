# Class:: php::modules::pear
#
# This class installs and deploys the php-pear module
class php::modules::pear {
  package { $php::pear_pkg :
    ensure  => present,
    require => Class['php'];
  }
#  define pear_channel ( $timeout=180 ) {
#    exec { "pear_channel_${name}":
#      command => "/usr/bin/pear channel-discover ${name}",
#      timeout => $timeout,
#      creates => "/usr/share/pear/.channels/${name}.reg",
#      require => Package['php-pear'],
#    }
#  }
#  define pear_install ( $timeout=180, $channel, $creates ) {
#    exec { "pear_install_${name}":
#      command => "/usr/bin/pear install ${name}",
#      timeout => $timeout,
#     creates => "/usr/share/pear/.registry/.channel.${channel}/${creates}.reg",
#      require => Exec["pear_channel_$channel"],
#    }
#  }
}

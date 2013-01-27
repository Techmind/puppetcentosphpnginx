# Class: nginx
#
# This module manages NGINX.
#
# Parameters:
#
# There are no default parameters for this class. All module parameters are managed
# via the nginx::params class
#
# Actions:
#
# Requires:
#  puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
#  
#  Packaged NGINX
#    - RHEL: EPEL or custom package
#    - Debian/Ubuntu: Default Install or custom package
#    - SuSE: Default Install or custom package
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include nginx
# }
class centosrepos {
  
  $osmajorversion = $operatingsystemrelease ? {
        /6./ => '6',
	/5./ => '5',
	default => $operatingsystemrelease
  }
  $osname = $operatingsystem ? {
	/CentOS|centos/ => centos,
	default => $operatingsystem
  }

  yumrepo { "epel":
      baseurl => "http://download.fedoraproject.org/pub/epel/$osmajorversion/\$basearch",
      descr => "Extra Packages for Enterprise Linux 6 - \$basearch",
      enabled => 1,
      gpgcheck => 0
  }

  yumrepo { "remi":
      baseurl => "http://rpms.famillecollet.com/enterprise/$osmajorversion/remi/\$basearch/",
      descr => "Extra Packages for Enterprise Linux 6 - \$basearch",
      enabled => 1,
      gpgcheck => 0
  }
}

CENTOS vagrantbox with puppet installing fpm & nginx
(have bus with Augeas - currently apc.ini is bugged and have string not matching regexp like ".*=.*", for example - "apc.filters") 

php,nginx modules are copied from puppetlabs and edited a bit

* todo, push changes to puppetlabs repo after checking it works and install flawlessly
* also figure out how to fix bug with vagrant failing to initialize network (to fix temporarly - rm /etc/sysconfig/network-scripts/ifcfg-eth1 and reload)

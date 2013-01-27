class { 
	'centosrepos':;

	'php':
        webserver       => "nginx",
	modules         => ['apc','bcmath','cli','fpm','gd','log','mbstring','pear','xml'],
        apc_progressbar => false,
        php_error_log   => "php_errors.log";
	'nginx' :
}

include apache
apache::mod {
	[
		'proxy',
		'actions',
		'proxy_fcgi',
		'rewrite'
	]:
		package_ensure => 'present'
}

###########################
# add vhost to apache
###########################
apache::vhost { 'sandbox.dev - non-ssl':
	servername      => 'sandbox.dev',
	port            => '80',
	docroot         => '/var/www/sandbox',
	redirect_status => 'permanent',
	redirect_dest   => 'https://sandbox.dev/'
}

apache::vhost { 'sandbox.dev':
	port            => '443',
	docroot         => '/var/www/sandbox',
	docroot_owner   => 'sandbox',
	docroot_group   => 'sandbox',
	directories     => [
		{ path             => '/var/www/sandbox',
			directoryindex => '/index.php index.php',
			allow_override => 'All',
			require        => 'all granted'
		},
	],
	error_log_file  => "sandbox.dev.log",
	custom_fragment => 'ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/sandbox/$1',
	ssl             => true,
	ssl_cert        => '/vagrant/environments/dev/files/sandbox.dev.cert',
	ssl_key         => '/vagrant/environments/dev/files/sandbox.dev.key',
}

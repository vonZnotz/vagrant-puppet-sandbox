class { '::php::globals':
	php_version => '7.1',
}->class { '::php':
	settings => {
		'mail function/sendmail_path' => '/usr/bin/mailhog sendmail',
		'PHP/DisplayErrors' => 'On',
	},
	manage_repos => true,
}

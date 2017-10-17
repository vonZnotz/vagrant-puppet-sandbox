class { '::php::globals':
	php_version => '7.2',
}->class { '::php':
	settings => {
		'mail function/sendmail_path' => '/usr/bin/mailhog sendmail',
		'PHP/DisplayErrors' => 'On',
	},
	manage_repos => true,
}

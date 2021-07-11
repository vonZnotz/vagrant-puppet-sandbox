class { '::php':
  ensure       => latest,
  manage_repos => true,
  fpm          => true,
  dev          => true,
  composer     => true,
  pear         => true,
  phpunit      => false,
	settings => {
		'mail function/sendmail_path' => '/usr/bin/mailhog sendmail',
		'PHP/DisplayErrors' => 'On',
	},
}
package {
	[
		"sendmail",
		"software-properties-common"
	]:
		ensure => present;
}

accounts::user { 'sandbox':
	groups  => [
		'www-data',
		'adm'
	],
	shell => '/bin/bash',
	password => '$6$FsvJM0mx$MkRjvOTE/Sxyv7PeXFU5WGUQ2GgyiYTNpjdbB3wdOgiuTeWTUR.MRXyprrW585XIE/Njt/MjseSJNnHm82uDO0',
}

file { '/var/www/sandbox':
	ensure => 'directory',
	owner  => 'sandbox',
	group  => 'sandbox',
	mode   => '0755',
}
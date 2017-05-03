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
	sshkeys => [
		'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDATSSkpu6/7yPAAuXZSVrrrjCyxSk2jgmyZY2vA+mi/FLrel1cMOnDlCjjYK0KH3WBz4sH4zVNJT+AaxHa5EfGUerj/Lz3+bf5AFgQSWMH/TAJBZkTH3GgI0GLVvapmwNHtGaV7L7BB39gS5/UG60yDuD+qXVSfj+mPorFPyUTALexrO30qWLABGJpIbKzmN62iyE7f2Cw2/53uPTTvmYj7b6EZP82baAJT1o81aGs9BDjyRwDXZ/AFHZz8HmbgMk199z20ReTAZpALYhYnnRopHxP2eYRWxTLpnFm3UCgN/7Fv8Dxj2BAx1PFof4eZiY5zZPLY1y25ZcnKlATgqub t.neumann@mac-11.elevator.local'
	],
	password => '$6$FsvJM0mx$MkRjvOTE/Sxyv7PeXFU5WGUQ2GgyiYTNpjdbB3wdOgiuTeWTUR.MRXyprrW585XIE/Njt/MjseSJNnHm82uDO0',
}

file { '/var/www/sandbox':
	ensure => 'directory',
	owner  => 'sandbox',
	group  => 'sandbox',
	mode   => '0755',
}
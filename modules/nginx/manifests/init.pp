# Manage nginx webserver

class nginx {
	package { 'apache2':
		ensure => absent,
	}

	package { 'httpd':
		ensure => absent,
	}

	package { 'nginx':
		ensure => installed,
		require => Package['apache2'],
	}
	
	service { 'nginx':
		ensure => running,
		require => Package['nginx'],
		enable => true,
	}		

	file { '/etc/nginx/sites-enabled/default':
		source => 'puppet:///modules/nginx/cat-pictures.conf',
		notify => Service['nginx'],
	}
}

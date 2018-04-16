# Instead of Nginx module, the implementation is based on standard modules such as package, file, and service. 
class nginx {
	package { 'nginx':
		ensure => installed,
	}
	
	service { 'nginx':
		ensure => running,
		require => Package['nginx'],
		enable => true,
	}		

	file { '/etc/nginx/sites-enabled/default':
		source => 'puppet:///modules/nginx/site.conf',
		notify => Service['nginx'],
		require => Package['nginx'],
	}

	file { '/var/www/site/':
		ensure => 'directory',
	}

	vcsrepo { '/var/www/site':
		ensure => 'present',
		provider => 'git',
		source => 'https://github.com/puppetlabs/exercise-webpage',
	}

}

class apache {
case $::osfamily{

"RedHat":{
	$web = ['hhtpd']
	service{'firewalld':
		ensure => stopped,
		enable => false
		}	
	

}

"Debian":{
	$web = ['apache2']
	exec{"atualiza pacotes":
		command => "/usr/bin/apt update"	
		}
	}



}

package{$web:
ensure => present}

service {$web:
	ensure => running
	}

file{"/var/www/html":
     source => "puppet:///modules/apache/file/index.html",
     ensure => present	
    }

}




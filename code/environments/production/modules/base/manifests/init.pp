class base {
	
case $::osfamily{
"Redhat" : {
	$pacotes = ["epel-release","git","vim","sysstat","htop","httpd","figlet"]
	   }

"Debian": {
	exec{"atualiza_pacotes":
		command => "/usr/bin/apt update"
	    }
   	$pacotes = ["git","vim","sysstat","htop","cowsay","figlet"]
	 }	
	}
package{$pacotes:
	ensure => present
	}
}


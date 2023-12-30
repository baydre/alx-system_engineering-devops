# script that adds custom http header using puppet

# Update system 
exec {'update_system':
  command => '/usr/bin/apt-get -y update',
}
# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}
# Get the hostname of the server
$hostname = $facts['hostname']

# Define Nginx configuration file path
$nginx_config_file = '/etc/nginx/sites-available/default'

# Configure Nginx with custom header using sed
exec { 'configure_nginx':
  command => "sed -i '51s|.*|add_header X-Served-By $hostname;|' $nginx_config_file",
  path    => '/usr/bin',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Restart Nginx
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => Exec['configure_nginx'],
}

#notify { 'Configuration Complete':
#  message => "Nginx configured with custom header X-Served-By on ${hostname}",
#}

# install & configure an nginx server using puppet.

# Update package repositories
exec { 'apt-update':
  command => 'apt-get -y update',
}

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Create a custom index file
file { '/var/www/html/index.nginx-debian.html':
  ensure  => file,
  content => 'Hello World!',
}

# Configure redirection
$redirect_config = "
  location /redirect_me {
    return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
  }
"

file { '/etc/nginx/sites-available/redirect_me':
  ensure  => file,
  content => "server {
    listen 80;
    server_name _;
    ${redirect_config}
  }",
  notify  => Service['nginx'],
}

# Create symbolic link to enable the site
file { '/etc/nginx/sites-enabled/redirect_me':
  ensure => link,
  target => '/etc/nginx/sites-available/redirect_me',
  notify => Service['nginx'],
}

# Configure custom 404 page
$custom_404_config = "
  error_page 404 /custom_404.html;
  location = /custom_404.html {
      root /var/www/html;
      internal;
  }
"

# Add custom 404 page configuration to default site
file_line { 'custom_404_config':
  path   => '/etc/nginx/sites-enabled/default',
  line   => $custom_404_config,
  match  => '^\s*server {',
  notify => Service['nginx'],
}

# Create custom 404 page content
file { '/var/www/html/custom_404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
}

# Restart Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [Package['nginx'], File['/etc/nginx/sites-available/redirect_me']],
}

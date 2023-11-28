# create a manifest that kills a process.
exec { 'killmenow':
  command => '/usr/bin/pkill -f killmenow'
}

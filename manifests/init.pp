# == Class: riemann
#
# Configures Riemann for monitoring.
#
# === Parameters
#
# Document parameters here.
#
# [server_port]
#   Port to run the Riemann server on.
#
# [websocket_port]
#   Port to accept websocket connections on.
#
class riemann (
  $server_port     = 5555,
  $websocket_port  = 5556,
  $extra_java_opts = [],
  ) {

  package {'riemann':
    ensure => latest,
  }

  file {'/etc/riemann/riemann.config':
    ensure  => present,
    content => template('riemann/etc/riemann/riemann.config.erb'),
    require => Package['riemann'],
  }

  file {'/etc/riemann.d/':
    ensure  => directory,
  }

  file {'/etc/sysconfig/riemann':
    ensure  => present,
    content => template('riemann/etc/sysconfig/riemann.erb'),
    require => Package['riemann'],
    notify  => Service['riemann'],
  }

  service {'riemann':
    ensure  => 'running',
    require => Package['riemann'],
  }

}

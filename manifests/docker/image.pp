# == Class: riemann::docker::image
#
# Configure a host to build the Riemann docker image.

class riemann::docker::image {

  vcsrepo { '/opt/docker-riemann':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-riemann.git',
    revision => 'master',
  }

  ~>
  file { '/opt/docker-riemann/riemann.d/graphite.clj':
    ensure => present,
    source => 'file:///opt/docker-riemann/optional/graphite.clj',
  }

  ~>
  docker::image { 'riemann':
    ensure     => present,
    docker_dir => '/opt/docker-riemann/',
  }

}

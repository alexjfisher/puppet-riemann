define riemann::docker::container (
  $image            = 'riemann',
  $depends          = undef,
  $link             = undef,
  $publish          = undef,
  $volumes_from     = undef,
) {

  docker_systemd::container { "$title":
    image        => $image,
    depends      => $depends,
    link         => $link,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}

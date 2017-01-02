class rkhunter::service inherits rkhunter {
  # rkhunter service configuration
  exec { 'Update rkhunter database':
    command => "${rkhunter::params::rkhunter_bin} --propupdate && /bin/touch ${::rkhunter::params::sysconfigfile_updated}",
    onlyif  => "/usr/bin/test ! -e ${::rkhunter::params::sysconfigfile_updated}",
  }
}


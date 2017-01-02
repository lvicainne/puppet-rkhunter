class rkhunter::install inherits rkhunter {

  package { 'rkhunter':
    ensure => installed,
    name   => $::rkhunter::package_name,
  }

  file { '/usr/local/bin/rktask':
    ensure => file,
    mode   => '0755',
    source => 'puppet:///modules/rkhunter/rktask'
  }
}

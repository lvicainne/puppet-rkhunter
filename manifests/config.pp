class rkhunter::config inherits rkhunter {

  #We ensure the configuration files
  file { '/etc/rkhunter.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rkhunter/etc/rkhunter.conf.erb');

  }

  #We ensure logs are always in the same directory
  if($rkhunter::logfile != '/var/log/rkhunter/rkhunter.log') {
    file { '/var/log/rkhunter':
      ensure  => 'directory',
      recurse => true,
      purge   => true,
    }
  } else {
    file { '/var/log/rkhunter':
      ensure  => 'directory',
      recurse => true,
      owner   => 'root',
      group   => 'root',
    }
  }

  if($rkhunter::logfile != '/var/log/rkhunter.log') {
    file { '/var/log/rkhunter.log':
      ensure => 'absent',
    }
  }

  #We ensure a crontable
  file { '/etc/cron.daily/rkhunter':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('rkhunter/cron.daily/rkhunter.erb')
  }

  file { '/etc/cron.weekly/rkhunter':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => template('rkhunter/cron.weekly/rkhunter.erb')
  }

  #We ensure the sysconfig file
  file { $rkhunter::sysconfigfile:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('rkhunter/sysconfig/rkhunter.erb'),
    require => Package['rkhunter']
  }

}

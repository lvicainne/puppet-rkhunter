# RKhunter

[![Build Status](https://travis-ci.org/lvicainne/puppet-rkhunter.svg?branch=master)](https://travis-ci.org/lvicainne/puppet-rkhunter)


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started](#setup)
    * [What module affects](#what-module-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with](#beginning-with)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module is a fork from [mmz-srf](https://github.com/mmz-srf/puppet-rkhunter)
Because I remanage the organisation of the manifests, I decided to rebuiold a new repository.

This module works under RedHat, CentOS 6+.

## Setup

### What module affects

Manage rkhunter installation and configuration with Puppet. 

### Features
- Manage 'allmost' all config entries (some of them dont make sense in server environments)
- Manage your whitelists
- The update and check cronjob is called staggered (predefined timewindow)

### Minimal configuration

```puppet
class yourclass{
  include ::rkhunter
  class {'rkhunter::cron':}
}
```

### A bit bigger configuration
```
class yourclass{
  class { 'rkhunter':
    allow_ssh_root_user         => 'yes',
    shared_lib_whitelist        => [ '/lib/snoopy.so' ],
    allow_syslog_remote_logging => "1",
    scriptwhitelist             => [ 
      '/bin/egrep',
      '/bin/fgrep',
      '/bin/which',
      '/usr/bin/groups',
      '/usr/bin/ldd',
      '/usr/bin/lwp-request',
      '/usr/sbin/adduser',
      '/usr/sbin/prelink',
      '/usr/bin/unhide.rb',
    ],
  }
  class {'rkhunter::cron':}
}
```
### List of optional configuration paramaeters
NOTE: there may be more. I do not update this list every time. Have a look into params.pp

```
  rotate_mirrors
  update_mirrors
  mirrors_mode
  mail_on_warning
  tmpdir
  dbdir
  scriptdir
  logfile
  append_log
  copy_log_on_error
  use_syslog
  color_set2
  auto_x_detect
  whitelisted_is_white
  allow_ssh_root_user
  allow_ssh_prot_v1
  enable_tests
  disable_tests
  immutable_set
  allow_syslog_remote_logging
  suspscan_temp
  suspscan_maxsize
  suspscan_thresh
  use_locking
  lock_timeout
  show_lockmsgs
  disable_unhide
  installdir
  ssh_config_dir
  hash_func
  hash_fld_idx
  package_manager
  pkgmgr_no_verfy
  ignore_prelink_dep_err
  use_sunsum
  existwhitelist
  attrwhitelist
  writewhitelist
  scan_mode_dev
  phlanx2_dirtest
  inetd_conf_path
  inetd_allowed_svc
  xinetd_conf_path
  xinetd_allowed_svc
  startup_paths
  passwd_file
  user_fileprop_files_dirs
  rtkt_file_whitelist
  rtkt_dir_whitelist
  scriptwhitelist
  immutewhitelist
  allowhiddendir
  allowhiddenfile
  allowprocdelfile
  allowproclisten
  allowpromiscif
  allowdevfile
  uid0_accounts
  pwdless_accounts
  syslog_config_file
  app_whitelist
  suspscan_dirs
  port_whitelist
  shared_lib_whitelist
```


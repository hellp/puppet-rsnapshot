# == Class: rsnapshot
#
# Manages rsnapshot.
#
# === Parameters
#
class rsnapshot (
  $hosts                         = $rsnapshot::params::hosts,
  $conf_d                        = $rsnapshot::params::conf_d,
  $logpath                       = $rsnapshot::params::config_logpath,
  $lockpath                      = $rsnapshot::params::config_lockpath,
  $default_backup                = $rsnapshot::params::config_default_backup,
  $package_name                  = $rsnapshot::params::package_name,
  $package_ensure                = $rsnapshot::params::package_ensure,
  $cron                          = $rsnapshot::params::cron,
) inherits rsnapshot::params {
  
  if $hosts {
    class { '::rsnapshot::install': }->
    class { '::rsnapshot::config': }
    contain '::rsnapshot::install'
    contain '::rsnapshot::config'
  }
}


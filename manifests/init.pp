# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xteve
class xteve (
  Boolean $package_manage = true,
  Boolean $service_manage = true,
  Boolean $service_active = true,
  Boolean $service_enable = true,
  String  $user           = 'xteve',
  String  $group          = 'xteve',
  String  $install_path   = '/opt',
  ) {

  contain xteve::config
  contain xteve::install
  contain xteve::service

  Class['::xteve::install']
  -> Class['::xteve::config']
  ~> Class['::xteve::service']

}
# vim: nu tabstop=8 expandtab shiftwidth=2 softtabstop=2

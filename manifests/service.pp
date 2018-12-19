# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xteve::service
class xteve::service {
  if $xteve::service_manage == true {

    #TODO set user from variable
    #TODO move user setting to drop in
    systemd::unit_file { 'xteve.service':
      enable  => $xteve::service_enable,
      active  => $xteve::service_active,
      content => template('xteve/xteve.service.erb'),
    }
  }
}
# vim: number tabstop=8 expandtab shiftwidth=2 softtabstop=2 ai

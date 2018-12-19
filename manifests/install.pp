# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xteve::install
class xteve::install {
  $install_path = $::xteve::install_path
  $extract_dir  = "${install_path}/xteve"
  $download_url = 'https://xteve.de/download/xteve_linux'

  if $xteve::package_manage {
    file { $extract_dir:
      ensure => directory,
      owner  => $::xteve::user,
      group  => $::xteve::group,
    }

    wget::fetch { 'xteve binary':
      source      => $download_url,
      destination => "${extract_dir}/",
      cache_dir   => '/var/cache/wget',
      timeout     => 15,
      verbose     => true,
      execuser    => $::xteve::user,
      group       => $::xteve::group,
    }

  }
}
# vim: number tabstop=8 expandtab shiftwidth=2 softtabstop=2

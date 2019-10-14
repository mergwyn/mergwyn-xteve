# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include xteve::install
class xteve::install {
  $install_path   = $::xteve::install_path
  $extract_dir    = "${install_path}/xteve"
  $creates        = "${extract_dir}/xteve/xteve"
  $archive_name   = 'xteve_2_linux_amd64.zip'
  $repository_url = "https://xteve.de/download/${archive_name}"
  $package_source = "${repository_url}/${archive_name}"
  $cache_dir      = '/var/cache/archive'
  $archive_path   = "${install_path}/${archive_name}"

  if $xteve::package_manage {
    file { [ $extract_dir, $cache_dir ] :
      ensure => directory,
      owner  => $::xteve::user,
      group  => $::xteve::group,
    }

    archive { $archive_name:
      path         => $archive_path,
      source       => $package_source,
      extract      => true,
      extract_path => $extract_dir,
      creates      => $creates,
      cleanup      => false,
      user         => $::xteve::user,
      group        => $::xteve::group,
      notify       => Service['xteve.service'],
      require      => File[$extract_dir],
    }

  }
}

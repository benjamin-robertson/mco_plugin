# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mco_plugin
class mco_plugin (
  String $mco_location = '/opt/puppetlabs/mcollective/plugins/mcollective/',
  Variant[Array, Pattern[/^\w*\.\w*$/, /^\w*\/\w*\.\w*$/, /^\w*\/\w*\/\w*\.\w*$/]] $mco_files = ['agent/shell.rb','agent/shell.ddl','agent/shell/job.rb', 'application/shell.rb', 'agent/shell/test.rb'],
  ) {
  # check to see if directory need to be created.
  $folders = []

  $mco_files.each | String $files| {
    if $files =~ /^\w*\/\w*\/\w*\.\w*$/ {
      $folder_to_create = split($files, '/')
      # First directory will already exists, create any sub directories.
      if $folder_to_create.length >= 2 {
        file {"${mco_location}${folder_to_create[0]}/${folder_to_create[1]}":
          ensure => directory,
        }
      }
    }
  }

  # iterate over the array of files to manage
  $mco_files.each | String $files| {
    file {"${mco_location}${files}":
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => "puppet:///modules/mco_plugin/${files}",
      notify => Service['mcollective'],
    }
  }
}

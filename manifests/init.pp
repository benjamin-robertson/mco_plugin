# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mco_plugin
class mco_plugin (
  String $mco_location = "/opt/puppetlabs/mcollective/plugins/mcollective/agent/",
  Variant[Array, Pattern[/^\w*\.\w*$/, /^\w*\/\w*\.\w*$/]] $mco_files = ['shell.rb','shell.ddl','shell/job.rb'],
  Optional Variant[Array, Pattern[/^\w*\.\w*$/, /^\w*\/\w*\.\w*$/]] $mco_application = undef,
  ) {
  
}

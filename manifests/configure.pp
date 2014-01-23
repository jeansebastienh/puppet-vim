# vim::configure
#
# Modude dédié à la configuration de vim
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define vim::configure ($str) {
  exec { "vimrc-${name}":
    command => "echo \"${str}\" >> /etc/vimrc",
    path    => '/usr/bin:/usr/sbin:/bin',
    onlyif  => "test `grep -c \"${str}\" /etc/vimrc` -eq 0"
  }
}

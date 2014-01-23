# Class: vim::pathogen_infect.pp
#
# Modude dédié à l'installation de pathogen
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class vim::pathogen_infect () {
  file { '/usr/share/vim/vimfiles/autoload/pathogen.vim':
    ensure => present,
    source => 'puppet:///modules/vim/pathogen.vim',
  }

  file { '/usr/share/vim/bundle': ensure => directory }

  vim::configure { 'helptags': str => 'execute pathogen#helptags()' }

  vim::configure { 'infect':
    str     => 'execute pathogen#infect(\"/usr/share/vim/bundle/{}\")',
    require => vim::configure['helptags']
  }

  vim::configure { 'incubate':
    str     => 'execute pathogen#incubate()',
    require => vim::configure['infect']
  }
}

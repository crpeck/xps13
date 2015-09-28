include apt

# setup virtualbox repo
apt::key { '7B0FAB3A13B907435925D9C954422A4B98AB5139':
  ensure => present,
  source => 'https://www.virtualbox.org/download/oracle_vbox.asc',
}
apt::source { 'virtualbox':
  location => 'http://download.virtualbox.org/virtualbox/debian',
  release  => $::lsbdistcodename,
  repos    => 'contrib',
  require  => Apt::Key['7B0FAB3A13B907435925D9C954422A4B98AB5139'],
}

package { [
  'git',
  'pidgin',
  'puppet-lint',
   's3cmd',
  'vim',
  ]:
  ensure => present,
}

package { 'virtualbox-5.0':
  ensure  => 'installed',
  require => Apt::Source['virtualbox'],
}

# Class: kibana
#
# This module manages kibana
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class kibana($elasticsearch_server ='localhost:9200')
{

  package {'kibana':
    ensure => present;
  }

  file { '/etc/httpd/conf.d/kibana.conf':
    ensure => 'file',
    group  => '0',
    mode   => '0644',
    owner  => '0',
    source => 'puppet:///modules/kibana/kibana.conf',
  }


  file { '/var/vhosts/kibana/htdocs/config.php':
    ensure   => 'file',
    group    => '0',
    mode     => '0664',
    owner    => '0',
    content  => template('kibana/config.php.erb')
  }

}

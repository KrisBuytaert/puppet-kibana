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

  

  file { '/var/vhosts/kibana/htdocs/config.php':
    ensure   => 'file',
    group    => '0',
    mode     => '0664',
    owner    => '0',
    content  => template('kibana/config.php.erb')
  }

}

# Use kibana::vhost if you don't manage apache already on this host (cfr
# https://github.com/KrisBuytaert/vagrant-puppet-logstash/blob/master/manifests/classes/my-logstash.pp
#
class kibana::vhost{
  file { '/etc/httpd/conf.d/kibana.conf':
    ensure => 'file',
    group  => '0',
    mode   => '0644',
    owner  => '0',
    source => 'puppet:///modules/kibana/kibana.conf',
  }

}


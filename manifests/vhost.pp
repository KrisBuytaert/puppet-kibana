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


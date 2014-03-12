name              'chef-client-wrapper'
maintainer        'Opscode, Inc.'
maintainer_email  'cookbooks@opscode.com'
license           'Apache 2.0'
description       'Manages client.rb configuration and chef-client service'
version           '0.0.1'

recipe 'chef-client', 'Includes the service recipe by default.'

depends 'chef-client'

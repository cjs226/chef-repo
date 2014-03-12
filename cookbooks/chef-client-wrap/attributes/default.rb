chef_client_cfg = Chef::DataBagItem.load("chef_client", "config")

default['chef_client']['interval'] = chef_client_cfg['interval']["#{node.environment}"]
default['chef_client']['log_file'] = chef_client_cfg['log_file']
default['chef_client']['splay']    = chef_client_cfg['splay']["#{node.environment}"]

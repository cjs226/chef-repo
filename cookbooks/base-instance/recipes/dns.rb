################################################################################
dns_domain     = "texicans.us"
aws_creds      = Chef::EncryptedDataBagItem.load("aws", "creds")
dns_cfg        = Chef::DataBagItem.load("dns_zones", "texicans_us")
include_recipe "route53"
################################################################################
package "dnsutils"
################################################################################
route53_record "create a record" do

  name                  "#{node['hostname']}.#{dns_domain}"
  value                 node['ipaddress']
  type                  "A"
  zone_id               dns_cfg['zone_id']
  aws_access_key_id     aws_creds['access_key_id']
  aws_secret_access_key aws_creds['secret_access_key']
  overwrite             true
  action                :create
  not_if                "host #{node['hostname']}.#{dns_domain}"
  
end

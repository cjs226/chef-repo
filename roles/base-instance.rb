name        "base-instance"

description "Base Instance"

run_list(
  "recipe[apt]",
  "recipe[rsyslog]",
  "recipe[loggly-rsyslog-wrap]",
  "recipe[base-instance::dns]",
  "recipe[chef-client-wrap]",
  "recipe[openssh]",
  "recipe[users]",
  "recipe[users::sysadmins]",
  "recipe[sudo]"
)

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups"       => ["sysadmin"],
      "passwordless" => "true"
    }
  }
)



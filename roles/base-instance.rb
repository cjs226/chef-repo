name        "base-instance"

description "Base Instance"

run_list(
  "recipe[apt]",
  "recipe[base-instance::dns]",
  "recipe[chef-client-wrap]",
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



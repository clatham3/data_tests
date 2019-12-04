connection: "looker_external"

include: "/Views/*.view"
include: "/*.dashboard"

label: "testing"
explore: orders {
  extends: [users]
}
explore: users {}

datagroup: datagroup_label_test {
  max_cache_age: "24 hours"
  label: "Datagroup Label"
  description: "This is refreshed every 24 hours"
}

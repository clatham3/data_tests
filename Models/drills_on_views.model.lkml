connection: "looker_external"

include: "/Views/*.view"
include: "/*.dashboard"

label: "testing"
explore: orders {
  extends: [users]
}
explore: users {}

datagroup: test_my_data {
  max_cache_age: "24 hours"
  label: "This is descriptive"
  description: "This is really just a test"
}

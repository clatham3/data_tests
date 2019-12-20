connection: "looker_external"

include: "/Views/*.view"
include: "/*.dashboard"
include: "/data_tests.lkml"

label: "Drills On Views"
datagroup: datagroup_label_test {
  max_cache_age: "24 hours"
}
explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  label: "this may be in the api call"
  tags: ["users","this explore is small","but its heart is huge"]
}

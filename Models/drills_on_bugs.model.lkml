connection: "looker_external"

include: "/Views/*.view"
include: "/*.dashboard"
include: "/data_tests.lkml"

label: "testing"
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

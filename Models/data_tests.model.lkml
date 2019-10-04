connection: "looker_external"

include: "/Views/orders.view"
include: "/Views/order_items.view"
include: "/data_tests.lkml"

explore: orders {
  view_name: orders
  from: orders
  extension: required
}

explore: orders_extended {
  extends: [orders]
}

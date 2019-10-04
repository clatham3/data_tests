test: order_id_is_unique {
  explore_source: orders_extended {
    column: id {
      field: orders.id
    }
    column: count {
      field: orders.count
    }
    sort: {
      field: count
      desc: yes
    }
    limit: 1
  }
  assert: order_id_is_unique {
    expression: ${orders.count}*0 = 3 ;;
  }
}

# test: order_items_id_is_unique {
#   explore_source: order_items {
#     column: id {}
#     column: count {}
#     sort: {
#       field: count
#       desc: yes
#     }
#     limit: 1
#   }
#   assert: order_items_id_is_unique {
#     expression: ${order_items.count} = 1 ;;
#   }
# }
#
# test: status_is_valid {
#   explore_source: orders {
#     column: status {
#       field: orders.status
#     }
#     sort: {
#       field: status
#       desc: yes     # Sorting of NULL can vary based on database
#     }
#     limit: 1
#   }
#   assert: status_is_not_null {
#     expression: NOT is_null(${orders.status}) ;;
#   }
# }

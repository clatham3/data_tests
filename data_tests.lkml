test: counts_by_age_tier {
  explore_source: order_items {
    column: order_items_count { field: order_items.counttest }
    column: orders_count { field: orders.count }
  }

  assert: order_items_counttest_is_positive {
    expression: ${order_items.counttest} > 0 ;;
  }

  assert: orders_count_is_positive {
    expression: ${orders.countt} > 0 ;;
  }

  assert: order_items_greater_than_orders {
    expression: ${order_items.counttest} >= ${orders.count} ;;
  }
}

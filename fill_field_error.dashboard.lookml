- dashboard: loc_dashboard_filters
  title: Loc Dashboard Filters
  layout: newspaper
  elements:
  - title: Count by Age
    name: Count by Age
    model: format_localization
    explore: orders
    type: looker_column
    fields: [users.age, orders.count]
    sorts: [orders.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: format_localization
    explore: orders
    type: looker_bar
    fields: [orders.count, orders.status, orders.order_amount]
    filters: {}
    sorts: [orders.order_amount desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Untitled Filter: orders.status
    row: 0
    col: 8
    width: 8
    height: 6
  - title: A Tile
    name: A Tile
    model: format_localization
    explore: orders
    type: looker_bar
    fields: [orders.status, users.name, orders.count]
    filters: {}
    sorts: [orders.status]
    limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Untitled Filter: orders.status
    row: 0
    col: 16
    width: 8
    height: 6
  filters:

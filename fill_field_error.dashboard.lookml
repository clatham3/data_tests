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
    fields: [orders.count, orders.status_label, orders.order_amount]
    filters: {}
    sorts: [orders.order_amount desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Untitled Filter: orders.status_label
    row: 0
    col: 8
    width: 8
    height: 6
  - title: A Tile
    name: A Tile
    model: format_localization
    explore: orders
    type: looker_bar
    fields: [orders.status_label, users.name, orders.count]
    filters: {}
    sorts: [orders.status_label]
    limit: 50
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Untitled Filter: orders.status_label
    row: 0
    col: 16
    width: 8
    height: 6
  - name: Merge Result
    title: Merge Result
    merged_queries:
    - model: format_localization
      explore: orders
      type: table
      fields: [orders.id, orders.status, orders.user_id]
      limit: 500
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
    - model: format_localization
      explore: users
      type: table
      fields: [users.age, users.name, users.id]
      sorts: [users.age]
      limit: 500
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: users.id
        source_field_name: orders.user_id
    hidden_fields: []
    y_axes: []
    type: table
    row: 6
    col: 16
    width: 8
    height: 6
  filters:
  - name: Untitled Filter
    title: Untitled Filter
    type: field_filter
    default_value: Confirmed
    allow_multiple_values: true
    required: false
    model: format_localization
    explore: orders
    listens_to_filters: []
    field: orders.status_label

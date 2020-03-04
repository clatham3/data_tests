- dashboard: suggestions
  title: suggestions
  layout: newspaper
  elements:
  - title: suggestion_bug
    name: suggestion_bug
    model: drills_on_views
    explore: orders_dt_suggestions
    type: table
    fields: [orders_dt_suggestions.status, orders_dt_suggestions.count]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      status parameter: orders_dt_suggestions.status_filter
      status dimension: orders_dt_suggestions.status
    row: 0
    col: 0
    width: 8
    height: 6
  - name: Testing
    type: text
    title_text: this is a test
    subtitle_text: this is a test
    body_text: This text tile is to test a LookML dashboard's ability to localize
      a subtitle
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: status parameter
    title: status parameter
    type: field_filter
    default_value: confirmed
    allow_multiple_values: true
    required: false
    model: drills_on_views
    explore: orders_dt_suggestions
    listens_to_filters: []
    field: orders_dt_suggestions.status_filter
  - name: status dimension
    title: status dimension
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: drills_on_views
    explore: orders_dt_suggestions
    listens_to_filters: [status parameter]
    field: orders_dt_suggestions.status

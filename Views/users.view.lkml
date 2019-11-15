view: users {
  sql_table_name: looker_test.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  parameter: field_picker {
    label: "Fields"
    type: unquoted
    allowed_value: {
      label: "Name"
      value: "name"
    }
    allowed_value: {
      label: "Epoch"
      value: "epoch_at"
    }
    allowed_value: {
      label: "Age"
      value: "age"
    }
    default_value: "Age"
  }

  dimension: field {
    label_from_parameter: field_picker
    type: number
    sql: ${TABLE}.{% parameter field_picker %} ;;
  }

  dimension: epoch_at {
    type: number
    sql: ${TABLE}.epoch_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: yyyymmdd_at {
    type: number
    sql: ${TABLE}.yyyymmdd_at ;;
  }

  # dimension: this_name {
  #   type: string
  #   sql: ${TABLE}.name ;;
  # }

  measure: count {
    type: count
    drill_fields: [id, name, orders.count]
  }
}

datagroup: datagroup_label_test {
  sql_trigger: SELECT COUNT(*) FROM users ;;
  label: "Wow"
}

view: orders_dt_suggestions {
  derived_table: {
    sql:
      SELECT *
      FROM "LOOKER_TEST"."ORDERS"
      WHERE
        status = {% parameter status_filter %}
        AND {% condition date_filter %} created_at {% endcondition %}
    ;;
  }

  parameter: status_filter {
    type: string
#     suggest_explore: orders
#     suggest_dimension: orders.status
    default_value: "confirmed"
  }

  filter: date_filter {
    type: date_time
    default_value: "7 days ago for 7 days"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
  }
}

include: "/Views/*.view"

datagroup: datagroup_label_test {
  sql_trigger: SELECT COUNT(*) FROM users ;;
  label: "Wow"
}

explore: orders_dt_suggestions {}
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
    suggest_explore: orders
    suggest_dimension: orders.status
    default_value: "confirmed"
  }

  filter: date_filter {
    type: date_time
    default_value: "7 days ago for 7 days"
  }
}

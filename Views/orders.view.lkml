# include: "/data_tests.lkml"
view: orders {
  sql_table_name: looker_test.orders ;;

  dimension: id {
    primary_key:  yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    group_label: "Time"
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_amount {
    type: number
    sql: ${TABLE}.order_amount ;;
  }

  parameter: order_picker {
    type: unquoted
    label: "Picker"
    allowed_value: {
      value: "id"
      label: "Order_ID"
    }
    allowed_value: {
      value: "user_id"
      label: "User_ID"
    }
    allowed_value: {
      value: "order_amount"
      label: "Amount"
    }
    default_value: "order_amount"
  }

  dimension: string_test {
    type: string
    sql: 'Neglect,/&Abuse' ;;
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
    drill_fields: [id, status]
  }
}

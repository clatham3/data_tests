view: users_month_tndt {
  sql_table_name: looker_test.users_month_tndt ;;

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  dimension: users_created_at_month {
    type: string
    sql: ${TABLE}.`users.created_at_month` ;;
  }

  dimension: users_sum_age {
    type: number
    sql: ${TABLE}.`users.sum_age` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

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

  dimension: tier_test {
    type: tier
    tiers: [10,20,30,40,50]
    sql: ${age} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, orders.count]
  }
}

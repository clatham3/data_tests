view: order_items {
  sql_table_name: looker_test.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    label: "hmm"
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: sku_num {
    type: number
    sql: ${TABLE}.sku_num ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: counttest {
    type: number
    sql:
    {% if _model._name == 'drills_on_bugs' %}
      ${count}*-1
    {% else %} ${count} {% endif %}
    ;;
  }
}

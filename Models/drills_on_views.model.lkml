connection: "looker_external"

include: "/Views/*.view"
include: "/*.dashboard"
include: "/data_tests.lkml"
include: "/datagroup.lkml"

label: "Drills On Views"

explore: orders_dt_suggestions {
  join: orders {
    sql_on: ${orders.id} = ${orders_dt_suggestions.id} ;;
    relationship: one_to_one
  }
}

explore: orders {}

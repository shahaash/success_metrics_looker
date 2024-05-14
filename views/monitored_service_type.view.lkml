view: monitored_service_type {
  sql_table_name: public.monitored_service_type ;;

  dimension: monitored_service_type {
    type: string
    sql: ${TABLE}."monitored_service_type" ;;
  }
  dimension: name {
    suggest_persist_for: "15 minutes"
    type: string
    sql: ${TABLE}."name" ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}

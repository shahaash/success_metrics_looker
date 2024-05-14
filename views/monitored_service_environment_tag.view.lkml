view: monitored_service_environment_tag {
  sql_table_name: public.monitored_service_environment_tag ;;

  dimension: environment_tag_id {
    type: number
    sql: ${TABLE}."environment_tag_id" ;;
  }
  dimension: monitored_service_id {
    type: number
    sql: ${TABLE}."monitored_service_id" ;;
  }
  dimension: org_uuid {
    type: string
    sql: ${TABLE}."org_uuid" ;;
  }
  measure: count {
    type: count
  }
}

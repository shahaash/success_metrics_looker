view: monitored_service_environment_tag {
  sql_table_name: public.monitored_service_environment_tag ;;

  dimension: environment_tag_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."environment_tag_id" ;;
  }
  dimension: monitored_service_id {
    type: number
    sql: ${TABLE}."monitored_service_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [environment_tag.id, environment_tag.name]
  }
}

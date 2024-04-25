view: monitored_service_general_tag {
  sql_table_name: public.monitored_service_general_tag ;;

  dimension: general_tag_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."general_tag_id" ;;
  }
  dimension: monitored_service_id {
    type: number
    sql: ${TABLE}."monitored_service_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [general_tag.id, general_tag.name]
  }
}

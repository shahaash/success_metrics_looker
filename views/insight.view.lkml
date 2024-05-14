view: insight {
  sql_table_name: public.insight ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: monitored_service_id {
    type: number
    sql: ${TABLE}."monitored_service_id" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: org_uuid {
    type: string
    sql: ${TABLE}."org_uuid" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

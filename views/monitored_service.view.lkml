view: monitored_service {
  sql_table_name: public.monitored_service ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: monitored_service_type {
    type: string
    sql: ${TABLE}."monitored_service_type" ;;
  }
  dimension: name {
    suggest_persist_for: "15 minutes"
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

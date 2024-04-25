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
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: tenant_key {
    type: string
    sql: ${TABLE}."tenant_key" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

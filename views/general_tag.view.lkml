view: general_tag {
  sql_table_name: public.general_tag ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
    drill_fields: [id, name, monitored_service_general_tag.count]
  }
}

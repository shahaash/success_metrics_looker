view: insight {
  sql_table_name: public.insight ;;
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
    drill_fields: [id, name, insight_occurrence_metric.count]
  }
}

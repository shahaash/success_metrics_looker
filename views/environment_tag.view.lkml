view: environment_tag {
  sql_table_name: public.environment_tag ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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

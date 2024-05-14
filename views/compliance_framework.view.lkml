view: compliance_framework {
  sql_table_name: public.compliance_framework ;;
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
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

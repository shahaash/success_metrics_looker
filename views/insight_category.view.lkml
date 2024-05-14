view: insight_category {
  sql_table_name: public.insight_category ;;
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
  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

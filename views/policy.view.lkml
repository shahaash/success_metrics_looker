view: policy {
  sql_table_name: public.policy ;;
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
    suggest_persist_for: "15 minutes"
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: org_uuid {
    type: string
    sql: ${TABLE}."org_uuid" ;;
  }
  dimension: policy_type {
    suggest_persist_for: "15 minutes"
    type: string
    sql: ${TABLE}."policy_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

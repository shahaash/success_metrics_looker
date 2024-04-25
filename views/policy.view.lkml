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
    # hidden: yes
    sql: ${TABLE}."monitored_service_id" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: tenant_key {
    type: string
    sql: ${TABLE}."tenant_key" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      monitored_service.name,
      monitored_service.id,
      policy_violation_metric.count,
      preview_ruleevent_summary.count
    ]
  }

}

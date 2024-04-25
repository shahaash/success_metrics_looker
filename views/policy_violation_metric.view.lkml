view: policy_violation_metric {
  sql_table_name: public.policy_violation_metric ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: compliance_framework {
    type: string
    sql: ${TABLE}."compliance_framework" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created" ;;
  }
  dimension_group: modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour]
    sql: ${TABLE}."modified" ;;
  }
  dimension: monitored_service_id {
    type: number
    sql: ${TABLE}."monitored_service_id" ;;
  }
  dimension: monitored_service_type {
    type: number
    sql: ${TABLE}."monitored_service_type" ;;
  }
  dimension: period {
    type: string
    sql: ${TABLE}."period" ;;
  }
  dimension: period_value {
    type: number
    sql: ${TABLE}."period_value" ;;
  }
  dimension_group: period_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour]
    sql: CASE
         WHEN ${TABLE}.period = 'hour' THEN TIMESTAMP '1980-01-06 00:00:00' + ${TABLE}.period_value * INTERVAL '1 hour'
         WHEN ${TABLE}.period = 'day' THEN TIMESTAMP '1980-01-06 00:00:00' + ${TABLE}.period_value * INTERVAL '1 day'
         WHEN ${TABLE}.period = 'week' THEN TIMESTAMP '1980-01-06 00:00:00' + ${TABLE}.period_value * INTERVAL '1 week'
         WHEN ${TABLE}.period = 'month' THEN TIMESTAMP '1980-01-06 00:00:00' + ${TABLE}.period_value * INTERVAL '1 month'
       END ;;
  }
  dimension: policy_id {
    type: number
    sql: ${TABLE}."policy_id" ;;
  }
  dimension_group: policy_last_opened {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."policy_last_opened" ;;
  }
  dimension: policy_mttr {
    type: string
    sql: ${TABLE}."policy_mttr" ;;
  }
  dimension: policy_open {
    type: number
    sql: ${TABLE}."policy_open" ;;
  }
  dimension: policy_resolved {
    type: number
    sql: ${TABLE}."policy_resolved" ;;
  }
  dimension: policy_total_resolved {
    type: number
    sql: ${TABLE}."policy_total_resolved" ;;
  }
  dimension: policy_type {
    type: number
    sql: ${TABLE}."policy_type" ;;
  }
  dimension: risk_score {
    type: number
    sql: ${TABLE}."risk_score" ;;
  }
  dimension: risk_level_order {
    case: {
      when: {
        sql: (${TABLE}."risk_score" > 75) AND (${TABLE}."risk_score" <= 100) ;;
        label: "Critical"
      }
      when: {
        sql: (${TABLE}."risk_score" > 50) AND (${TABLE}."risk_score" <= 75) ;;
        label: "High"
      }
      when: {
        sql: (${TABLE}."risk_score" > 25) AND (${TABLE}."risk_score" <= 50) ;;
        label: "Medium"
      }
      when: {
        sql: (${TABLE}."risk_score" > 0) AND (${TABLE}."risk_score" <= 25) ;;
        label: "Low"
      }
      when: {
        sql: ${TABLE}."risk_score" = 0 ;;
        label: "Informational"
      }
      else: "Unknown"
    }
  }
  dimension: risk_level {
    case: {
      when: {
        sql: (${TABLE}."risk_score" > 75) AND (${TABLE}."risk_score" <= 100) ;;
        label: "Critical"
      }
      when: {
        sql: (${TABLE}."risk_score" > 50) AND (${TABLE}."risk_score" <= 75) ;;
        label: "High"
      }
      when: {
        sql: (${TABLE}."risk_score" > 25) AND (${TABLE}."risk_score" <= 50) ;;
        label: "Medium"
      }
      when: {
        sql: (${TABLE}."risk_score" > 0) AND (${TABLE}."risk_score" <= 25) ;;
        label: "Low"
      }
      when: {
        sql: ${TABLE}."risk_score" = 0 ;;
        label: "Informational"
      }
      else: "Unknown"
    }
  }
  dimension: rule_id {
    type: number
    sql: ${TABLE}."rule_id" ;;
  }
  dimension: rule_type {
    type: number
    sql: ${TABLE}."rule_type" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension: status_level {
    case: {
      when: {
        sql: ${TABLE}."status" = 'open' ;;
        label: "open"
      }
      when: {
        sql: ${TABLE}."status" = 'resolved' ;;
        label: "resolved"
      }
    }
  }
  dimension: tenant_key {
    type: string
    sql: ${TABLE}."tenant_key" ;;
  }
  dimension: violation_mttr {
    type: string
    sql: ${TABLE}."violation_mttr" ;;
  }
  dimension: violation_open {
    type: number
    sql: ${TABLE}."violation_open" ;;
  }
  dimension: violation_resolved {
    type: number
    sql: ${TABLE}."violation_resolved" ;;
  }
  dimension: violation_total_resolved {
    type: number
    sql: ${TABLE}."violation_total_resolved" ;;
  }
  dimension: violation_unresolved_time {
    type: string
    sql: ${TABLE}."violation_unresolved_time" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
  filter: looker_date {
    type: date
  }

  dimension: end_selected_period_time {
    type: date
    sql: {% date_end period_time_date %};;
  }
  dimension: start_selected_period_time {
    type: date
    sql: {% date_start period_time_date %};;
  }

  dimension: diff_days {
    type: number
    sql: DATE_PART('day',CAST(${end_selected_period_time} AS TIMESTAMP) -  CAST(${start_selected_period_time} AS TIMESTAMP))  ;;
  }

  dimension: period_range {
    case: {
      when: {
        sql: (${diff_days} >= 0) AND (${diff_days} <= 14) ;;
        label: "day"
      }
      when: {
        sql: (${diff_days} >= 15) AND (${diff_days} <= 60) ;;
        label: "week"
      }
      when: {
        sql: (${diff_days} > 60);;
        label: "month"
      }
      else: "day"

    }
  }

  dimension: policy_period_date {
    type: date
    label: "{% if _filters['period_time_date'] == 'today' %} Day
    {% elsif _filters['period_time_date'] == 'yesterday' %} Day
    {% elsif _filters['period_time_date'] == '7 day' %} Day
    {% elsif _filters['period_time_date'] == '14 day' %} Day
    {% elsif _filters['period_time_date'] == '28 day' %} Week
    {% elsif _filters['period_time_date'] == '30 day' %} Week
    {% elsif _filters['period_time_date'] == '90 day' %} Month
    {% elsif _filters['period_time_date'] == '180 day' %} Month
    {% elsif _filters['period_time_date'] == '365 day' %} Month
    {% elsif _filters['period_time_date'] == 'this week' %} Day
    {% elsif _filters['period_time_date'] == 'last week' %} Day
    {% elsif _filters['period_time_date'] == 'last month' %} Week
    {% elsif _filters['period_time_date'] == 'last quarter' %} Month
    {% elsif _filters['period_time_date'] == 'last year' %} Month
    {% else %}
    {% endif %}"

    html: {% if _filters['period_time_date'] == 'today' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == 'yesterday' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == '7 Day' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == '14 day' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == '28 day' %} {{period_time_week}}
          {% elsif _filters['period_time_date'] == '30 day' %} {{period_time_week}}
          {% elsif _filters['period_time_date'] == '90 day' %} {{period_time_month}}
          {% elsif _filters['period_time_date'] == '180 day' %} {{period_time_month}}
          {% elsif _filters['period_time_date'] == '365 day' %} {{period_time_month}}
          {% elsif _filters['period_time_date'] == 'this week' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == 'last week' %} {{period_time_date}}
          {% elsif _filters['period_time_date'] == 'last month' %} {{period_time_week}}
          {% elsif _filters['period_time_date'] == 'last quarter' %} {{period_time_month}}
          {% elsif _filters['period_time_date'] == 'last year' %} {{period_time_month}}
          {% endif %};;

    sql:
        (
          CASE
            WHEN ${diff_days} BETWEEN 0 AND 14 THEN ${period_time_date}
            WHEN ${diff_days} BETWEEN 15 AND 60 THEN TO_DATE(${period_time_week}, 'YYYY-MM-DD')
            WHEN ${diff_days} > 60 THEN TO_DATE(${period_time_month}, 'YYYY-MM')
            ELSE ${period_time_date}
          END
        );;
    convert_tz: no
  }
}

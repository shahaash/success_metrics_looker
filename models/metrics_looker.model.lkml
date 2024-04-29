connection: "duplicate_test_appomni"

include: "/views/**/*.view.lkml"
include: "/dashboards/looker_dashboard.dashboard.lookml"
# include: "/dashboards/metrics_insights_dashboard.dashboard.lookml"
# include: "/dashboards/metrics_policies_dashboard.dashboard.lookml"

datagroup: metrics_looker_default_datagroup {
  max_cache_age: "1 hour"
}
week_start_day: sunday
persist_with: metrics_looker_default_datagroup

explore: environment_tag {
  sql_always_where: {% if _user_attributes['appomni_env_restricted'] == "True" %}
                      ${environment_tag.id} IN ({{ _user_attributes['appomni_allowed_envs']}})
                    {% endif %};;
  access_filter: {
    field: environment_tag.tenant_key
    user_attribute: appomni_org_key
  }
}

explore: general_tag {
  access_filter: {
    field: general_tag.tenant_key
    user_attribute: appomni_org_key
  }
}

explore: policy {
  access_filter: {
    field: policy.tenant_key
    user_attribute: appomni_org_key
  }
  access_filter: {
    field: policy.monitored_service_id
    user_attribute: appomni_allowed_ms
  }
}

explore: monitored_service_type {}

explore: monitored_service {
  join: monitored_service_type {
    type: inner
    sql_on: ${monitored_service_type.monitored_service_type} = ${monitored_service.monitored_service_type} ;;
    relationship: many_to_one
  }
  access_filter: {
    field: monitored_service.tenant_key
    user_attribute: appomni_org_key
  }
  access_filter: {
    field: monitored_service.id
    user_attribute: appomni_allowed_ms
  }
}

explore: compliance_framework {}

explore: insight_category {}

explore: policy_violation_metric {
  join: policy {
    type: inner
    sql_on: ${policy.id} = ${policy_violation_metric.policy_id};;
    relationship: many_to_one
  }
  join: monitored_service_environment_tag {
    type: inner
    sql_on: ${monitored_service_environment_tag.monitored_service_id} = ${policy_violation_metric.monitored_service_id};;
    relationship: many_to_many
  }
  join: monitored_service_general_tag {
    type: inner
    sql_on: ${monitored_service_general_tag.monitored_service_id} = ${policy_violation_metric.monitored_service_id};;
    relationship: many_to_many
  }
  join: environment_tag {
    type: inner
    sql_on: ${environment_tag.id} = ${monitored_service_environment_tag.environment_tag_id} ;;
    relationship: many_to_one
  }
  join: general_tag {
    type: inner
    sql_on: ${general_tag.id} = ${monitored_service_general_tag.general_tag_id};;
    relationship: many_to_one
  }
  join: monitored_service {
    type: inner
    sql_on: ${monitored_service.id} = ${policy_violation_metric.monitored_service_id};;
    relationship: many_to_one
  }
  join: monitored_service_type {
    type: inner
    sql_on: ${monitored_service_type.monitored_service_type} = ${monitored_service.monitored_service_type} ;;
    relationship: many_to_one
  }
  join: compliance_framework {
    type: inner
    sql_on: ${compliance_framework.id} = ANY(SELECT UNNEST ${policy_violation_metric.compliance_framework}) ;;
    relationship: many_to_one
  }
  sql_always_where: {% if _user_attributes['appomni_env_restricted'] == "True" %}
                      ${monitored_service_environment_tag.monitored_service_id} IN ({{ _user_attributes['appomni_allowed_envs']}}) AND
                    {% endif %}
                    ${period} = ${period_range};;
  access_filter: {
    field: policy_violation_metric.tenant_key
    user_attribute: appomni_org_key
  }
  access_filter: {
    field: policy_violation_metric.monitored_service_id
    user_attribute: appomni_allowed_ms
  }
}

explore: insight_occurrence_metric {
  join: monitored_service_environment_tag {
    type: inner
    sql_on: ${monitored_service_environment_tag.monitored_service_id} = ${insight_occurrence_metric.monitored_service_id};;
    relationship: many_to_many
  }
  join: monitored_service_general_tag {
    type: inner
    sql_on: ${monitored_service_general_tag.monitored_service_id} = ${insight_occurrence_metric.monitored_service_id};;
    relationship: many_to_many
  }
  join: environment_tag {
    type: inner
    sql_on: ${environment_tag.id} = ${monitored_service_environment_tag.environment_tag_id} ;;
    relationship: many_to_one
  }
  join: general_tag {
    type: inner
    sql_on: ${general_tag.id} = ${monitored_service_general_tag.general_tag_id};;
    relationship: many_to_one
  }
  join: monitored_service {
    type: inner
    sql_on: ${monitored_service.id} = ${insight_occurrence_metric.monitored_service_id} ;;
    relationship: many_to_one
  }
  join: monitored_service_type {
    type: inner
    sql_on: ${monitored_service_type.monitored_service_type} = ${monitored_service.monitored_service_type} ;;
    relationship: many_to_one
  }
  join: insight_category {
    type: inner
    sql_on: ${insight_category.id} = ${insight_occurrence_metric.category_id} ;;
    relationship: many_to_one
  }
  sql_always_where: {% if _user_attributes['appomni_env_restricted'] == "True" %}
                      ${monitored_service_environment_tag.monitored_service_id} IN ({{ _user_attributes['appomni_allowed_envs']}}) AND
                    {% endif %}
                    ${period} = ${period_range};;
  access_filter: {
    field: insight_occurrence_metric.tenant_key
    user_attribute: appomni_org_key
  }
  access_filter: {
    field: insight_occurrence_metric.monitored_service_id
    user_attribute: appomni_allowed_ms
  }
}
- dashboard: looker_dashboard
  title: Looker Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5bdzYges81FtaA8ZTQgG8z
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal">Policy
      Issues</h4>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Total Policy Issues Resolved
    name: Total Policy Issues Resolved
    model: metrics_looker
    explore: policy_violation_metric
    type: 2059_dvd_rental::Stat Card
    fields: [policy_violation_metric.risk_level_order, policy_violation_metric.count]
    fill_fields: [policy_violation_metric.risk_level_order]
    filters:
      policy_violation_metric.status: resolved
    sorts: [policy_violation_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${policy_violation_metric.count}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    hidden_fields: [policy_violation_metric.count]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved Policy Issues
    name: Open vs Resolved Policy Issues
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_area
    fields: [policy_violation_metric.policy_period_date, policy_violation_metric.policy_resolved,
      policy_violation_metric.policy_open, sum_of_policy_resolved, sum_of_policy_open]
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_policy_resolved
      based_on: policy_violation_metric.policy_resolved
      expression: ''
      label: Sum of Policy Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_policy_open
      based_on: policy_violation_metric.policy_open
      expression: ''
      label: Sum of Policy Open
      type: sum
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${policy_violation_metric.policy_open}>0 OR ${policy_violation_metric.policy_resolved}\
      \ > 0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Policy Issues, orientation: left, series: [{axisId: resolved
              - 1 - count, id: resolved - 1 - count, name: Resolved}], showLabels: true,
        showValues: true, minValue: 1, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_policy_resolved: "#32D583"
      sum_of_policy_open: "#F04438"
    series_labels:
      sum_of_policy_resolved: Resolved
      sum_of_policy_open: Open
    hidden_fields: [policy_violation_metric.policy_resolved, policy_violation_metric.policy_open]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 4
    col: 0
    width: 8
    height: 6
  - title: Policy Issues Resolved Over Time
    name: Policy Issues Resolved Over Time
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_column
    fields: [policy_violation_metric.count, policy_violation_metric.policy_period_date,
      policy_violation_metric.risk_level_order]
    pivots: [policy_violation_metric.risk_level_order]
    fill_fields: [policy_violation_metric.risk_level_order]
    filters:
      policy_violation_metric.status: resolved
    sorts: [policy_violation_metric.risk_level_order, policy_violation_metric.policy_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${policy_violation_metric.count}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    hidden_fields: [policy_violation_metric.count]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Policy Issues by Risk Level, orientation: left, series: [{axisId: 1
              - 0 - policy_violation_metric.count, id: 1 - 0 - policy_violation_metric.count,
            name: Critical}, {axisId: 2 - 1 - policy_violation_metric.count, id: 2
              - 1 - policy_violation_metric.count, name: High}, {axisId: 3 - 2 - policy_violation_metric.count,
            id: 3 - 2 - policy_violation_metric.count, name: Medium}, {axisId: 4 -
              3 - policy_violation_metric.count, id: 4 - 3 - policy_violation_metric.count,
            name: Low}, {axisId: 5 - 4 - policy_violation_metric.count, id: 5 - 4
              - policy_violation_metric.count, name: Informational}, {axisId: Unknown
              - 5 - policy_violation_metric.count, id: Unknown - 5 - policy_violation_metric.count,
            name: Unknown}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Critical - 0 - count: "#A50000"
      High - 1 - count: "#F04438"
      Medium - 2 - count: "#F79009"
      Low - 3 - count: "#FEC84B"
      Informational - 4 - count: "#84CAFF"
      Unknown - 5 - count: "#D2D6DB"
    column_group_spacing_ratio: 0.4
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 4
    col: 8
    width: 8
    height: 6
  - title: Policy Issues Mean Time to Resolution
    name: Policy Issues Mean Time to Resolution
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_line
    fields: [policy_violation_metric.policy_period_date, total_policy_mttr_calculation,
      sum_of_policy_resolved, policy_violation_metric.policy_resolved]
    filters:
      policy_violation_metric.policy_resolved: ">0"
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${policy_violation_metric.policy_mttr} * ${policy_violation_metric.policy_resolved}"
      label: Policy MTTR Calculation
      value_format:
      value_format_name:
      dimension: policy_mttr_calculation
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Policy MTTR Calculation
      value_format:
      value_format_name:
      based_on: policy_mttr_calculation
      _kind_hint: measure
      measure: total_policy_mttr_calculation
      type: sum
      _type_hint: number
    - measure: sum_of_policy_resolved
      based_on: policy_violation_metric.policy_resolved
      expression: ''
      label: Sum of Policy Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_policy_mttr_calculation}/${sum_of_policy_resolved}"
      label: Policy MTTR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: policy_mttr
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [policy_violation_metric.policy_resolved, total_policy_mttr_calculation,
      sum_of_policy_resolved]
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 4
    col: 16
    width: 8
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal">AppOmni
      Insights</h4>
    row: 20
    col: 0
    width: 24
    height: 2
  - title: Total AppOmni Insights Resolved
    name: Total AppOmni Insights Resolved
    model: metrics_looker
    explore: insight_occurrence_metric
    type: 2059_dvd_rental::Stat Card
    fields: [insight_occurrence_metric.risk_level_order, insight_occurrence_metric.count]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    filters:
      insight_occurrence_metric.status: resolved
    sorts: [insight_occurrence_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${insight_occurrence_metric.count}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    hidden_fields: [insight_occurrence_metric.count]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved AppOmni Insights
    name: Open vs Resolved AppOmni Insights
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [insight_occurrence_metric.insight_period_date, insight_occurrence_metric.insight_resolved,
      insight_occurrence_metric.insight_open, sum_of_insight_resolved, sum_of_insight_open]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_insight_open
      based_on: insight_occurrence_metric.insight_open
      expression: ''
      label: Sum of Insight Open
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_insight_resolved
      based_on: insight_occurrence_metric.insight_resolved
      expression: ''
      label: Sum of Insight Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${insight_occurrence_metric.insight_open} > 0 OR ${insight_occurrence_metric.insight_resolved}\
      \ > 0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: AppOmni Insights, orientation: left, series: [{axisId: resolved
              - 1 - count, id: resolved - 1 - count, name: Resolved}, {axisId: open
              - 0 - count, id: open - 0 - count, name: Open}], showLabels: true, showValues: true,
        minValue: 1, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_insight_resolved: "#32D583"
      sum_of_insight_open: "#F04438"
    series_labels:
      sum_of_insight_resolved: Resolved
      sum_of_insight_open: Open
    hidden_fields: [insight_occurrence_metric.insight_open, insight_occurrence_metric.insight_resolved]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 24
    col: 0
    width: 8
    height: 6
  - title: AppOmni Insights Resolved Over Time
    name: AppOmni Insights Resolved Over Time
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_column
    fields: [insight_occurrence_metric.count, insight_occurrence_metric.insight_period_date,
      insight_occurrence_metric.risk_level_order]
    pivots: [insight_occurrence_metric.risk_level_order]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    filters:
      insight_occurrence_metric.status: resolved
    sorts: [insight_occurrence_metric.risk_level_order, insight_occurrence_metric.insight_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${insight_occurrence_metric.count}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [insight_occurrence_metric.count]
    y_axes: [{label: AppOmni Insights, orientation: left, series: [{axisId: 1 - 0
              - insight_occurrence_metric.count, id: 1 - 0 - insight_occurrence_metric.count,
            name: Critical}, {axisId: 2 - 1 - insight_occurrence_metric.count, id: 2
              - 1 - insight_occurrence_metric.count, name: High}, {axisId: 3 - 2 -
              insight_occurrence_metric.count, id: 3 - 2 - insight_occurrence_metric.count,
            name: Medium}, {axisId: 4 - 3 - insight_occurrence_metric.count, id: 4
              - 3 - insight_occurrence_metric.count, name: Low}, {axisId: 5 - 4 -
              insight_occurrence_metric.count, id: 5 - 4 - insight_occurrence_metric.count,
            name: Informational}, {axisId: Unknown - 5 - insight_occurrence_metric.count,
            id: Unknown - 5 - insight_occurrence_metric.count, name: Unknown}], showLabels: true,
        showValues: true, minValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Critical - 0 - count: "#A50000"
      High - 1 - count: "#F04438"
      Medium - 2 - count: "#F79009"
      Low - 3 - count: "#FEC84B"
      Informational - 4 - count: "#84CAFF"
      Unknown - 5 - count: "#D2D6DB"
    column_group_spacing_ratio: 0.4
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 24
    col: 8
    width: 8
    height: 6
  - title: AppOmni Insights Mean Time to Resolution
    name: AppOmni Insights Mean Time to Resolution
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_line
    fields: [insight_occurrence_metric.insight_period_date, total_insight_mttr_calculation,
      sum_of_insight_resolved, insight_occurrence_metric.insight_resolved]
    filters:
      insight_occurrence_metric.insight_resolved: ">0"
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${insight_occurrence_metric.insight_mttr} * ${insight_occurrence_metric.insight_resolved}"
      label: Insight MTTR Calculation
      value_format:
      value_format_name:
      dimension: insight_mttr_calculation
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Insight MTTR Calculation
      value_format:
      value_format_name:
      based_on: insight_mttr_calculation
      _kind_hint: measure
      measure: total_insight_mttr_calculation
      type: sum
      _type_hint: number
    - measure: sum_of_insight_resolved
      based_on: insight_occurrence_metric.insight_resolved
      expression: ''
      label: Sum of Insight Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_insight_mttr_calculation}/${sum_of_insight_resolved}"
      label: Insight MTTR
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: insight_mttr
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [insight_occurrence_metric.insight_resolved, total_insight_mttr_calculation,
      sum_of_insight_resolved]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 24
    col: 16
    width: 8
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal">AppOmni
      Insight Occurrences</h4>
    row: 30
    col: 0
    width: 24
    height: 2
  - title: Total AppOmni Insight Occurrences Resolved
    name: Total AppOmni Insight Occurrences Resolved
    model: metrics_looker
    explore: insight_occurrence_metric
    type: 2059_dvd_rental::Stat Card
    fields: [insight_occurrence_metric.risk_level_order, sum_of_occurrence_resolved]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    filters:
      insight_occurrence_metric.status: resolved
    sorts: [insight_occurrence_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.occurrence_resolved
      expression: ''
      label: Sum of Occurrence Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: coalesce(${sum_of_occurrence_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
      is_disabled: false
    hidden_fields: [sum_of_occurrence_resolved]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_labels: true
    ordering: none
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 32
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved AppOmni Insight Occurrences
    name: Open vs Resolved AppOmni Insight Occurrences
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [insight_occurrence_metric.insight_period_date, insight_occurrence_metric.occurrence_resolved,
      insight_occurrence_metric.occurrence_open, sum_of_occurrence_resolved, sum_of_occurrence_open]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.occurrence_resolved
      expression: ''
      label: Sum of Occurrence Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_occurrence_open
      based_on: insight_occurrence_metric.occurrence_open
      expression: ''
      label: Sum of Occurrence Open
      type: sum
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${insight_occurrence_metric.occurrence_open} > 0 OR \n${insight_occurrence_metric.occurrence_resolved}\
      \ > 0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: AppOmni Insights Occurrences, orientation: left, series: [{axisId: sum_of_occurrence_resolved,
            id: sum_of_occurrence_resolved, name: Sum of Occurrence Resolved}, {axisId: sum_of_occurrence_open,
            id: sum_of_occurrence_open, name: Sum of Occurrence Open}], showLabels: true,
        showValues: true, minValue: 1, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_occurrence_open: "#F04438"
      sum_of_occurrence_resolved: "#32D583"
    series_labels:
      sum_of_occurrence_resolved: Resolved
      sum_of_occurrence_open: Open
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [insight_occurrence_metric.occurrence_resolved, insight_occurrence_metric.occurrence_open]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 34
    col: 0
    width: 8
    height: 6
  - title: AppOmni Insight Occurrences Resolved Over Time
    name: AppOmni Insight Occurrences Resolved Over Time
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_column
    fields: [sum_of_occurrence_resolved, insight_occurrence_metric.insight_period_date,
      insight_occurrence_metric.risk_level_order]
    pivots: [insight_occurrence_metric.risk_level_order]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    filters:
      insight_occurrence_metric.status: resolved
    sorts: [insight_occurrence_metric.risk_level_order, insight_occurrence_metric.insight_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.occurrence_resolved
      expression: ''
      label: Sum of Occurrence Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: coalesce(${sum_of_occurrence_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [sum_of_occurrence_resolved]
    y_axes: [{label: AppOmni Insights Occurrences, orientation: left, series: [{axisId: 1
              - 0 - insight_occurrence_metric.count, id: 1 - 0 - insight_occurrence_metric.count,
            name: Critical}, {axisId: 2 - 1 - insight_occurrence_metric.count, id: 2
              - 1 - insight_occurrence_metric.count, name: High}, {axisId: 3 - 2 -
              insight_occurrence_metric.count, id: 3 - 2 - insight_occurrence_metric.count,
            name: Medium}, {axisId: 4 - 3 - insight_occurrence_metric.count, id: 4
              - 3 - insight_occurrence_metric.count, name: Low}, {axisId: 5 - 4 -
              insight_occurrence_metric.count, id: 5 - 4 - insight_occurrence_metric.count,
            name: Informational}, {axisId: Unknown - 5 - insight_occurrence_metric.count,
            id: Unknown - 5 - insight_occurrence_metric.count, name: Unknown}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Critical - 0 - count: "#A50000"
      High - 1 - count: "#F04438"
      Medium - 2 - count: "#F79009"
      Low - 3 - count: "#FEC84B"
      Informational - 4 - count: "#84CAFF"
      Unknown - 5 - count: "#D2D6DB"
    column_group_spacing_ratio: 0.4
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 34
    col: 8
    width: 8
    height: 6
  - title: AppOmni Insights Occurrences Mean Time to Resolution
    name: AppOmni Insights Occurrences Mean Time to Resolution
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_line
    fields: [insight_occurrence_metric.insight_period_date, total_occurrence_mttr_calculation,
      sum_of_occurrence_resolved, insight_occurrence_metric.occurrence_resolved]
    filters:
      insight_occurrence_metric.occurrence_resolved: ">0"
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${insight_occurrence_metric.occurrence_mttr} *  ${insight_occurrence_metric.occurrence_resolved}"
      label: Occurrence MTTR Calculation
      value_format:
      value_format_name:
      dimension: occurrence_mttr_calculation
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Occurrence MTTR Calculation
      value_format:
      value_format_name:
      based_on: occurrence_mttr_calculation
      _kind_hint: measure
      measure: total_occurrence_mttr_calculation
      type: sum
      _type_hint: number
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.occurrence_resolved
      expression: ''
      label: Sum of Occurrence Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_occurrence_mttr_calculation}/${sum_of_occurrence_resolved}"
      label: 'Occurrence MTTR '
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: occurrence_mttr
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [insight_occurrence_metric.occurrence_resolved, total_occurrence_mttr_calculation,
      sum_of_occurrence_resolved]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 34
    col: 16
    width: 8
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal">Policy
      Issues Violations</h4>
    row: 10
    col: 0
    width: 24
    height: 2
  - title: Total Policy Issue Violations Resolved
    name: Total Policy Issue Violations Resolved
    model: success_metrics_model
    explore: policy_violation_metric
    type: 2059_dvd_rental::Stat Card
    fields: [policy_violation_metric.risk_level_order, sum_of_violation_resolved]
    fill_fields: [policy_violation_metric.risk_level_order]
    sorts: [sum_of_violation_resolved desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_violation_resolved
      based_on: policy_violation_metric.violation_resolved
      expression: ''
      label: Sum of Violation Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: coalesce(${sum_of_violation_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    hidden_fields: [sum_of_violation_resolved]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 12
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved Policy Issue Violations
    name: Open vs Resolved Policy Issue Violations
    model: success_metrics_model
    explore: policy_violation_metric
    type: looker_area
    fields: [policy_violation_metric.policy_period_date, policy_violation_metric.violation_resolved,
      policy_violation_metric.violation_open, sum_of_violation_resolved, sum_of_violation_open]
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_violation_open
      based_on: policy_violation_metric.violation_open
      expression: ''
      label: Sum of Violation Open
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_violation_resolved
      based_on: policy_violation_metric.violation_resolved
      expression: ''
      label: Sum of Violation Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${policy_violation_metric.violation_open} > 0 OR ${policy_violation_metric.violation_resolved}\
      \ > 0"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Policy Issue Violations, orientation: left, series: [{axisId: sum_of_violation_resolved,
            id: sum_of_violation_resolved, name: Resolved}, {axisId: sum_of_violation_open,
            id: sum_of_violation_open, name: Open}], showLabels: true, showValues: true,
        minValue: 1, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_violation_resolved: "#32D583"
      sum_of_violation_open: "#F04438"
    series_labels:
      sum_of_violation_open: Open
      sum_of_violation_resolved: Resolved
    hidden_fields: [policy_violation_metric.violation_open, policy_violation_metric.violation_resolved]
    defaults_version: 1
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 14
    col: 0
    width: 8
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: metrics_looker
    explore: policy_violation_metric
    listens_to_filters: []
    field: policy_violation_metric.looker_date
  - name: Risk
    title: Risk
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: metrics_looker
    explore: policy_violation_metric
    listens_to_filters: []
    field: policy_violation_metric.risk_level
  - name: Monitored Service
    title: Monitored Service
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: metrics_looker
    explore: monitored_service
    listens_to_filters: [Service Type]
    field: monitored_service.name
  - name: Environment
    title: Environment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: metrics_looker
    explore: environment_tag
    listens_to_filters: []
    field: environment_tag.name
  - name: Tags
    title: Tags
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: metrics_looker
    explore: general_tag
    listens_to_filters: []
    field: general_tag.name
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: metrics_looker
    explore: monitored_service
    listens_to_filters: [Monitored Service]
    field: monitored_service_type.name
  - name: Policy Name
    title: Policy
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
      options: []
    model: metrics_looker
    explore: policy
    listens_to_filters: []
    field: policy.name
  - name: Policy Type
    title: Policy Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
      options: []
    model: metrics_looker
    explore: policy
    listens_to_filters: []
    field: policy.type
  - name: Categories
    title: Categories
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: metrics_looker
    explore: insight_category
    listens_to_filters: []
    field: insight_category.name
  - name: Compliance Framework
    title: Compliance Framework
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: metrics_looker
    explore: compliance_framework
    listens_to_filters: []
    field: compliance_framework.name

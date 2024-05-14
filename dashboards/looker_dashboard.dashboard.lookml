- dashboard: looker_dashboard
  title: Looker Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8cY8JzotzzTeiZCy2pBjCc
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
    fields: [policy_violation_metric.risk_level_order, sum_of_policy_resolved]
    fill_fields: [policy_violation_metric.risk_level_order]
    sorts: [policy_violation_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${sum_of_policy_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - measure: sum_of_policy_resolved
      based_on: policy_violation_metric.times_resolved
      expression: ''
      label: Sum of Policy Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [sum_of_policy_resolved]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    defaults_version: 0
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.policy_type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Open vs. Resolved Policy Issues
    name: Open vs Resolved Policy Issues
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_area
    fields: [policy_violation_metric.policy_period_date, sum_of_policy_total_resolved, sum_of_policy_open]
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_policy_total_resolved
      based_on: policy_violation_metric.total_times_resolved
      expression: ''
      label: Sum of Policy Total Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_policy_open
      based_on: policy_violation_metric.times_opened
      expression: ''
      label: Sum of Policy Open
      type: sum
      _kind_hint: measure
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Policy Issues, orientation: left, series: [{axisId: sum_of_policy_total_resolved,
            id: sum_of_policy_total_resolved, name: Resolved}, {axisId: sum_of_policy_open,
            id: sum_of_policy_open, name: Open}], showLabels: true, showValues: true,
        minValue: !!null '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_policy_total_resolved: "#32D583"
      sum_of_policy_open: "#F04438"
    series_labels:
      sum_of_policy_total_resolved: Resolved
      sum_of_policy_open: Open
    hidden_fields:
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.policy_type
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
    fields: [policy_violation_metric.policy_period_date, policy_violation_metric.risk_level_order, sum_of_policy_resolved]
    pivots: [policy_violation_metric.risk_level_order]
    fill_fields: [policy_violation_metric.risk_level_order]
    sorts: [policy_violation_metric.risk_level_order, policy_violation_metric.policy_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${sum_of_policy_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - measure: sum_of_policy_resolved
      based_on: policy_violation_metric.times_resolved
      expression: ''
      label: Sum of Policy Resolved
      type: sum
      _kind_hint: measure
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
    hidden_fields: [sum_of_policy_resolved]
    y_axes: [{label: Policy Issues, orientation: left, series: [{axisId: Critical
              - 0 - count, id: Critical - 0 - count, name: Critical}, {axisId: High
              - 1 - count, id: High - 1 - count, name: High}, {axisId: Medium - 2
              - count, id: Medium - 2 - count, name: Medium}, {axisId: Low - 3 - count,
            id: Low - 3 - count, name: Low}, {axisId: Informational - 4 - count, id: Informational
              - 4 - count, name: Informational}, {axisId: Unknown - 5 - count, id: Unknown
              - 5 - count, name: Unknown}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Policy Type: policy.policy_type
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
      sum_of_policy_resolved]
    filters:
      sum_of_policy_resolved: ">0"
    filters: {}
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${policy_violation_metric.mttr_float} * ${policy_violation_metric.times_resolved}"
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
      based_on: policy_violation_metric.times_resolved
      expression: ''
      label: Sum of Policy Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_policy_mttr_calculation}/${sum_of_policy_resolved}"
      label: MTTR (Days)
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: mttr_float
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mttr_float, id: mttr_float,
            name: MTTR (Days)}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [total_policy_mttr_calculation, sum_of_policy_resolved]
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.policy_type
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
    fields: [insight_occurrence_metric.risk_level_order, sum_of_insight_resolved]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    sorts: [insight_occurrence_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${sum_of_insight_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - measure: sum_of_insight_resolved
      based_on: insight_occurrence_metric.times_resolved
      expression: ''
      label: Sum of Insight Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    hidden_fields: [sum_of_insight_resolved]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    defaults_version: 0
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
      Date: insight_occurrence_metric.period_time_date
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Open vs. Resolved AppOmni Insights
    name: Open vs Resolved AppOmni Insights
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [insight_occurrence_metric.insight_period_date, sum_of_insight_total_resolved, sum_of_insight_open]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_insight_total_resolved
      based_on: insight_occurrence_metric.total_times_resolved
      expression: ''
      label: Sum of Insight Total Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_insight_open
      based_on: insight_occurrence_metric.times_opened
      expression: ''
      label: Sum of Insight Open
      type: sum
      _kind_hint: measure
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: AppOmni Insights, orientation: left, series: [{axisId: sum_of_insight_total_resolved,
            id: sum_of_insight_total_resolved, name: Resolved}, {axisId: sum_of_insight_open,
            id: sum_of_insight_open, name: Open}], showLabels: true, showValues: true,
        minValue: !!null '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_insight_total_resolved: "#32D583"
      sum_of_insight_open: "#F04438"
    series_labels:
      sum_of_insight_total_resolved: Resolved
      sum_of_insight_open: Open
    hidden_fields:
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
    fields: [insight_occurrence_metric.risk_level_order, sum_of_insight_resolved,
      insight_occurrence_metric.insight_period_date]
    pivots: [insight_occurrence_metric.risk_level_order]
    fill_fields: [insight_occurrence_metric.risk_level_order]
    sorts: [insight_occurrence_metric.risk_level_order, insight_occurrence_metric.insight_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${sum_of_insight_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - measure: sum_of_insight_resolved
      based_on: insight_occurrence_metric.times_resolved
      expression: ''
      label: Sum of Insight Resolved
      type: sum
      _kind_hint: measure
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
    hidden_fields: [sum_of_insight_resolved]
    y_axes: [{label: AppOmni Insights, orientation: left, series: [{axisId: Critical
              - 0 - count, id: Critical - 0 - count, name: Critical}, {axisId: High
              - 1 - count, id: High - 1 - count, name: High}, {axisId: Medium - 2
              - count, id: Medium - 2 - count, name: Medium}, {axisId: Low - 3 - count,
            id: Low - 3 - count, name: Low}, {axisId: Informational - 4 - count, id: Informational
              - 4 - count, name: Informational}, {axisId: Unknown - 5 - count, id: Unknown
              - 5 - count, name: Unknown}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
      sum_of_insight_resolved]
    filters:
      sum_of_insight_resolved: ">0"
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${insight_occurrence_metric.mttr_float} * ${insight_occurrence_metric.times_resolved}"
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
      based_on: insight_occurrence_metric.times_resolved
      expression: ''
      label: Sum of Insight Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_insight_mttr_calculation}/${sum_of_insight_resolved}"
      label: MTTR (Days)
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: mttr_float
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mttr_float, id: mttr_float,
            name: MTTR (Days)}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [total_insight_mttr_calculation, sum_of_insight_resolved]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
    sorts: [insight_occurrence_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.items_resolved
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
    hidden_fields: [sum_of_occurrence_resolved]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    defaults_version: 0
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
      Date: insight_occurrence_metric.period_time_date
    row: 32
    col: 0
    width: 24
    height: 2
  - title: Open vs. Resolved AppOmni Insight Occurrences
    name: Open vs Resolved AppOmni Insight Occurrences
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [insight_occurrence_metric.insight_period_date,sum_of_occurrence_total_resolved, sum_of_occurrence_open]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_total_resolved
      based_on: insight_occurrence_metric.total_items_resolved
      expression: ''
      label: Sum of Occurrence Total Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_occurrence_open
      based_on: insight_occurrence_metric.items_open
      expression: ''
      label: Sum of Occurrence Open
      type: sum
      _kind_hint: measure
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: AppOmni Insights Occurrences, orientation: left, series: [{axisId: sum_of_occurrence_total_resolved,
            id: sum_of_occurrence_total_resolved, name: Resolved}, {axisId: sum_of_occurrence_open,
            id: sum_of_occurrence_open, name: Open}], showLabels: true, showValues: true,
        minValue: !!null '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_occurrence_total_resolved: "#32D583"
      sum_of_occurrence_open: "#F04438"
    series_labels:
      sum_of_occurrence_total_resolved: Resolved
      sum_of_occurrence_open: Open
    hidden_fields:
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
    sorts: [insight_occurrence_metric.risk_level_order, insight_occurrence_metric.insight_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_occurrence_resolved
      based_on: insight_occurrence_metric.items_resolved
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
    y_axes: [{label: AppOmni Insights Occurrences, orientation: left, series: [{axisId: Critical
              - 0 - count, id: Critical - 0 - count, name: Critical}, {axisId: High
              - 1 - count, id: High - 1 - count, name: High}, {axisId: Medium - 2
              - count, id: Medium - 2 - count, name: Medium}, {axisId: Low - 3 - count,
            id: Low - 3 - count, name: Low}, {axisId: Informational - 4 - count, id: Informational
              - 4 - count, name: Informational}, {axisId: Unknown - 5 - count, id: Unknown
              - 5 - count, name: Unknown}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
      sum_of_occurrence_resolved]
    filters:
      sum_of_occurrence_resolved: ">0"
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${insight_occurrence_metric.item_mttr_float} *  ${insight_occurrence_metric.items_resolved}"
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
      based_on: insight_occurrence_metric.items_resolved
      expression: ''
      label: Sum of Occurrence Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_occurrence_mttr_calculation}/${sum_of_occurrence_resolved}"
      label: MTTR (Days)
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: item_mttr_float
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: item_mttr_float, id: item_mttr_float,
            name: MTTR (Days)}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [total_occurrence_mttr_calculation,sum_of_occurrence_resolved]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Risk: insight_occurrence_metric.risk_level
      Categories: insight_category.name
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
      Issue Violations</h4>
    row: 10
    col: 0
    width: 24
    height: 2
  - title: Total Policy Issue Violations Resolved
    name: Total Policy Issue Violations Resolved
    model: metrics_looker
    explore: policy_violation_metric
    type: 2059_dvd_rental::Stat Card
    fields: [policy_violation_metric.risk_level_order, sum_of_violation_resolved]
    fill_fields: [policy_violation_metric.risk_level_order]
    sorts: [policy_violation_metric.risk_level_order]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_violation_resolved
      based_on: policy_violation_metric.items_resolved
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
    defaults_version: 0
    listen:
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Policy Name: policy.name
      Policy Type: policy.policy_type
      Compliance Framework: compliance_framework.name
    row: 12
    col: 0
    width: 24
    height: 2
  - title: Open vs. Resolved Policy Issue Violations
    name: Open vs Resolved Policy Issue Violations
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_area
    fields: [policy_violation_metric.policy_period_date, sum_of_violation_total_resolved, sum_of_violation_open]
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: sum_of_violation_open
      based_on: policy_violation_metric.items_open
      expression: ''
      label: Sum of Violation Open
      type: sum
      _kind_hint: measure
      _type_hint: number
    - measure: sum_of_violation_total_resolved
      based_on: policy_violation_metric.total_items_resolved
      expression: ''
      label: Sum of Violation Total Resolved
      type: sum
      _kind_hint: measure
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Policy Issue Violations, orientation: left, series: [{axisId: sum_of_violation_total_resolved,
            id: sum_of_violation_total_resolved, name: Resolved}, {axisId: sum_of_violation_open,
            id: sum_of_violation_open, name: Open}], showLabels: true, showValues: true,
        minValue: !!null '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_violation_total_resolved: "#32D583"
      sum_of_violation_open: "#F04438"
    series_labels:
      sum_of_violation_total_resolved: Resolved
      sum_of_violation_open: Open
    hidden_fields:
    defaults_version: 1
    listen:
      Policy Name: policy.name
      Monitored Service: monitored_service.name
      Service Type: monitored_service_type.name
      Policy Type: policy.policy_type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Policy Issue Violations Resolved Over Time
    name: Policy Issue Violations Resolved Over Time
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_column
    fields: [policy_violation_metric.risk_level_order, policy_violation_metric.policy_period_date,
      sum_of_violation_resolved]
    pivots: [policy_violation_metric.risk_level_order]
    fill_fields: [policy_violation_metric.risk_level_order]
    sorts: [policy_violation_metric.risk_level_order, policy_violation_metric.policy_period_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: coalesce(${sum_of_violation_resolved}, 0)
      label: Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: count
      _type_hint: number
    - measure: sum_of_violation_resolved
      based_on: policy_violation_metric.items_resolved
      expression: ''
      label: Sum of Violation Resolved
      type: sum
      _kind_hint: measure
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
    hidden_fields: [sum_of_violation_resolved]
    y_axes: [{label: Policy Issue Violations, orientation: left, series: [{axisId: Critical
              - 0 - count, id: Critical - 0 - count, name: Critical}, {axisId: High
              - 1 - count, id: High - 1 - count, name: High}, {axisId: Medium - 2
              - count, id: Medium - 2 - count, name: Medium}, {axisId: Low - 3 - count,
            id: Low - 3 - count, name: Low}, {axisId: Informational - 4 - count, id: Informational
              - 4 - count, name: Informational}, {axisId: Unknown - 5 - count, id: Unknown
              - 5 - count, name: Unknown}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
      Policy Type: policy.policy_type
      Environment: environment_tag.name
      Tags: general_tag.name
      Compliance Framework: compliance_framework.name
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
    row: 14
    col: 8
    width: 8
    height: 6
  - title: Policy Issue Violations Mean Time to Resolution
    name: Policy Issue Violations Mean Time to Resolution
    model: metrics_looker
    explore: policy_violation_metric
    type: looker_line
    fields: [policy_violation_metric.policy_period_date, total_violation_mttr_calculation,
      sum_of_violation_resolved]
    filters:
      sum_of_violation_resolved: ">0"
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${policy_violation_metric.item_mttr_float} * ${policy_violation_metric.items_resolved}"
      label: Violation MTTR Calculation
      value_format:
      value_format_name:
      dimension: violation_mttr_calculation
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Total Violation MTTR Calculation
      value_format:
      value_format_name:
      based_on: violation_mttr_calculation
      _kind_hint: measure
      measure: total_violation_mttr_calculation
      type: sum
      _type_hint: number
    - measure: sum_of_violation_resolved
      based_on: policy_violation_metric.items_resolved
      expression: ''
      label: Sum of Violation Resolved
      type: sum
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${total_violation_mttr_calculation}/${sum_of_violation_resolved}"
      label: MTTR (Days)
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: item_mttr_float
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: violation_mttr_calculation,
            id: violation_mttr_calculation, name: MTTR (Days)}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trend_lines: [{color: "#b8b8b8", label_position: right, order: 3, period: 7, regression_type: linear,
        series_index: 1, show_label: false}]
    defaults_version: 1
    hidden_fields: [total_violation_mttr_calculation, sum_of_violation_resolved]
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Risk: policy_violation_metric.risk_level
      Date: policy_violation_metric.period_time_date
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Policy Name: policy.name
      Policy Type: policy.policy_type
      Compliance Framework: compliance_framework.name
    row: 14
    col: 16
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
      options: []
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
    field: policy.policy_type
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

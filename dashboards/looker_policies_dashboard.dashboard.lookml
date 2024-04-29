
- dashboard: looker_policies_dashboard
  title: Looker Policies Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: IquKD29XPTyXqlYeOk505M
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
    fields: [policy_violation_metric.policy_period_date, policy_violation_metric.count,
      policy_violation_metric.status_level]
    pivots: [policy_violation_metric.status_level]
    fill_fields: [policy_violation_metric.status_level]
    filters:
      policy_violation_metric.status: open,resolved
    sorts: [policy_violation_metric.status_level desc, policy_violation_metric.policy_period_date
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
      resolved - count: "#32D583"
      open - count: "#F04438"
      resolved - 1 - count: "#32D583"
      open - 0 - count: "#F04438"
    series_labels:
      resolved - count: Resolved
      open - count: Open
      resolved - 1 - count: Resolved
      open - 0 - count: Open
    hidden_pivots: {}
    hidden_fields: [policy_violation_metric.count]
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
    hidden_fields: [policy_violation_metric.count]
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
    explore: policy_violation_metric
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

- dashboard: looker_dashboard
  title: Looker Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: s5VsW01RmBYizKZvMGFKAT
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
    fields: [policy_violation_metric.policy_mttr, policy_violation_metric.policy_period_date]
    sorts: [policy_violation_metric.policy_period_date desc]
    limit: 500
    column_limit: 50
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
    row: 10
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
    row: 12
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved AppOmni Insights
    name: Open vs Resolved AppOmni Insights
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [insight_occurrence_metric.count, insight_occurrence_metric.insight_period_date,
      insight_occurrence_metric.status_level]
    pivots: [insight_occurrence_metric.status_level]
    fill_fields: [insight_occurrence_metric.status_level]
    filters:
      insight_occurrence_metric.status: open,resolved
    sorts: [insight_occurrence_metric.status_level desc, insight_occurrence_metric.insight_period_date
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
    hidden_fields: [insight_occurrence_metric.count]
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
      open - count: "#F04438"
      resolved - count: "#32D583"
      resolved - 1 - count: "#32D583"
      open - 0 - count: "#F04438"
    series_labels:
      open - count: Open
      resolved - count: Resolved
      resolved - 1 - count: Resolved
      open - 0 - count: Open
    hidden_pivots: {}
    hidden_fields: [insight_occurrence_metric.count]
    defaults_version: 1
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 14
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
      hidden_fields: [insight_occurrence_metric.count]
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
    hidden_fields: [insight_occurrence_metric.count]
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 14
    col: 8
    width: 8
    height: 6
  - title: AppOmni Insights Mean Time to Resolution
    name: AppOmni Insights Mean Time to Resolution
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_line
    fields: [insight_occurrence_metric.insight_mttr, insight_occurrence_metric.insight_period_date]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
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
    listen:
      Monitored Service: monitored_service.name
      Environment: environment_tag.name
      Tags: general_tag.name
      Service Type: monitored_service_type.name
      Categories: insight_category.name
      Risk: insight_occurrence_metric.risk_level
      Date: insight_occurrence_metric.period_time_date
    row: 14
    col: 16
    width: 8
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    body_text: <h4 style="font-size:22px; margin-top:30px; font-style:normal">AppOmni
      Insight Occurrences</h4>
    row: 20
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
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Open vs Resolved AppOmni Insight Occurrences
    name: Open vs Resolved AppOmni Insight Occurrences
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_area
    fields: [sum_of_insight_open, sum_of_insight_resolved, insight_occurrence_metric.insight_period_date]
    fill_fields: [insight_occurrence_metric.insight_period_date]
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
    y_axes: [{label: AppOmni Insights Occurrences, orientation: left, series: [{axisId: sum_of_insight_open,
            id: sum_of_insight_open, name: Sum of Insight Open}, {axisId: sum_of_insight_resolved,
            id: sum_of_insight_resolved, name: Sum of Insight Resolved}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      sum_of_insight_open: "#F04438"
      sum_of_insight_resolved: "#32D583"
      sum_of_insight_resolved - 1 - count: "#32D583"
      sum_of_insight_open - 0 - count: "#F04438"
    series_labels:
      sum_of_insight_open: Open
      sum_of_insight_resolved: Resolved
      sum_of_insight_resolved - 1 - count: Resolved
      sum_of_insight_open - 0 - count: Open
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
    hidden_fields: [sum_of_occurrence_resolved]
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
    hidden_fields: [sum_of_occurrence_resolved]
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
  - title: AppOmni Insights Occurrences Mean Time to Resolution
    name: AppOmni Insights Occurrences Mean Time to Resolution
    model: metrics_looker
    explore: insight_occurrence_metric
    type: looker_line
    fields: [insight_occurrence_metric.insight_period_date, insight_occurrence_metric.occurrence_mttr]
    sorts: [insight_occurrence_metric.insight_period_date desc]
    limit: 500
    column_limit: 50
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

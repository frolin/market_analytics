# frozen_string_literal: true

class ReportComponent < ViewComponent::Base
  def initialize(reports:, field_list:)
    @reports = reports
    @field_list = field_list
    @chart_data = chart_data_set
  end

  def chart_data_set
    @field_list.map do |name, field_name|
      { name: name, data: chart_data(field_name) }
    end
  end

  def chart_data(field)
    report_data_by_field(field)
  end

  def report_data_by_field(field_name)
    by_field_name = @reports.group_by { |report| report.data[field_name.to_s] }.to_h

    by_field_name.flat_map do |k, reports|
      result = reports.map { |report| report.data[field_name].to_i }.sum

      [k, result]
    end
  end
end

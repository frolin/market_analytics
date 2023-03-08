# frozen_string_literal: true

class SourceReportDecorator < ApplicationDecorator
  delegate_all

  def chart_data(field_name)
    by_field_name = object.group_by { |report| report.data[field_name.to_s] }.to_h

    by_field_name.flat_map do |k, reports|
      result = reports.map { |report| report.data[field_name].to_i }.sum

      [k, result]
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end

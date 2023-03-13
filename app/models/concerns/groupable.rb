module Groupable
  extend ActiveSupport::Concern

  included do
    scope :grouped_by_date, ->(start_date, end_date) { where(date: start_date..end_date).group('DATE(date)').count  }

    # scope :grouped_by_date_sum_price, ->(start_date, end_date) { between_dates(start_date, end_date).group('DATE(date)').sum("(data->>'price')::int") }
  end

  class_methods do
    def group_by_date_with_zero(start_date, end_date)
      if start_date.blank? || end_date.blank? || start_date == end_date
        start_date = DateTime.now.beginning_of_week
        end_date = DateTime.now.end_of_week
        date_range = start_date..end_date
      else
        date_range = start_date..end_date
      end

      records_grouped_by_date = grouped_by_date(start_date.to_datetime.beginning_of_day, end_date.to_datetime.end_of_day)

      date_range.each_with_object({}) do |date, result|
        result[date.to_s] = records_grouped_by_date[date] || 0
      end
    end
  end
end
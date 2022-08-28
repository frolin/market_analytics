class Sell < ApplicationRecord
  belongs_to :order

  def self.today_count
    start_first = DateTime.now.beginning_of_day
    start_last = DateTime.now.end_of_day

    Sell.where(date: start_first..start_last).count
  end

  def self.wb_find(odid:)
    find_by("api_data->>'odid' = ?", odid.to_s)
  end
end

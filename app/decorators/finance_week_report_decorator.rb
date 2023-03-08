# frozen_string_literal: true

class FinanceWeekReportDecorator < ApplicationDecorator
  delegate_all

  def payed_sum; end
end

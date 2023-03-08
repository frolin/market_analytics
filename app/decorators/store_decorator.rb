# frozen_string_literal: true

class StoreDecorator < ApplicationDecorator
  delegate_all
  decorates_association :week_reports
end

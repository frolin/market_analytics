# frozen_string_literal: true

class AdDecorator < ApplicationDecorator
  delegate_all

  def ads_status
    case object.status
    when 'pause' then false
    when 'show' then true
    end
  end
end

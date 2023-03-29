# frozen_string_literal: true

class Card::Component < ApplicationViewComponent
  def initialize(title:, data:, sum: nil, icon_class: nil, color: nil)
    @title = title
    @data = data
    @sum =  money(sum, precision: 0)
    @icon_class = icon_class
    @color = color || Chartjs::Component::COLOR_PALLET[7]
  end
end

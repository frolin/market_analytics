# frozen_string_literal: true

class DateRange::Component < ApplicationViewComponent
  attr_reader :path, :frame_name

  def initialize(path:, frame_name:)
    @path = path
    @frame_name = frame_name
  end

end

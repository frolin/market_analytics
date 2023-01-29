module Filters
  class DateRange
    DASHBOARD = [:order, :sale, ]

    def self.filter(range, scope, type)
      new(range, scope, type).filter
    end

    def initialize(range, scope, type)
      @range = range
      @scope = scope
    end

    def filter
      case @scope
      when @type
        @scope

      end
    end

    def by_date

    end

    def date_column


    end
  end
end
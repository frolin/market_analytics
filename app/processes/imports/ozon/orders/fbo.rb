module Imports
  module Ozon
    module Orders
      class Fbo < Api::OzonBase
        record :user
        symbol :status, default: :delivered
        integer :days, default: 7
        integer :limit, default: 1000

        def execute
          response
        end

        private

        def api_method
          '/v2/posting/fbo/list'
        end

        def type
          :post
        end

        def params
          {
            "dir": "ASC",
            "filter": {
              "since": range[:since],
              "status": status,
              "to": range[:to]
            },
            "limit": limit,
            "offset": 0,
            "translit": true,
            "with": {
              "analytics_data": true,
              "financial_data": true
            }
          }
        end

        def range
          {
            to: DateTime.now.to_s,
            since: DateTime.now.advance(days: -days).to_s
          }
        end

        def api_type
        end

      end
    end
  end
end
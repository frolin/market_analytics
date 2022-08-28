module Api
  module Wildberries
    module Stats
      class Orders < Api::WildberriesClient
        record :user
        string :date_from


        def execute
          response
        end

        private

        def base_url
          'https://suppliers-stats.wildberries.ru'
        end

        def api_method
          'api/v1/supplier/orders'
        end

        def key
          user.wb.campaigns.last.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from,
            key: key}
        end
      end
    end
  end
end
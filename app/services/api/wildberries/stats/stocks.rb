module Api
  module Wildberries
    module Stats
      class Stocks < Api::WildberriesClient
        record :user
        record :campaign
        string :date_from, default: DateTime.now.strftime("%Y-%m-%d")

        def execute
          response
        end

        private

        def base_url
          'https://suppliers-stats.wildberries.ru'
        end

        def api_method
          'api/v1/supplier/stocks'
        end

        def key
          campaign.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from,
            key: key }
        end
      end
    end
  end
end
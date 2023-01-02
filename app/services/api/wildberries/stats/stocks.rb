module Api
  module Wildberries
    module Stats
      class Stocks < Api::WildberriesClient
        record :store
        string :date_from, default: DateTime.now.strftime("%Y-%m-%d")

        def execute
          response
        end

        private

        def base_url
          'https://statistics-api.wildberries.ru'
        end

        def api_method
          'api/v1/supplier/stocks'
        end

        def token
          store.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from }
        end
      end
    end
  end
end
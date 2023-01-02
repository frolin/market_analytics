module Api
  module Wildberries
    module Stats
      class Sales < Api::WildberriesClient
        record :user
        record :store
        string :date_from

        def execute
          response
        end

        private

        def base_url
          'https://statistics-api.wildberries.ru'
        end

        def api_method
          '/api/v1/supplier/sales'
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
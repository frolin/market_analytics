module Api
  module Wildberries
    module Stats
      class Reports < Api::WildberriesClient
        record :store
        date :date_from, default: '2023-01-01'
        date :date_to, default: Date.today.strftime("%d-%m-%Y")
        integer :limit, default: 100000

        def execute
          response
        end

        private

        def base_url
          'https://statistics-api.wildberries.ru'
        end

        def api_method
          'api/v1/supplier/reportDetailByPeriod'
        end

        def token
          store.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from,
            dateTo: date_to }
        end
      end
    end
  end
end
module Api
  module Wildberries
    module Stats
      class Orders < Api::WildberriesClient
        record :store
        string :date_from
        integer :flag, default: 0


        def execute
          response
        end

        private

        def base_url
          'https://statistics-api.wildberries.ru'
        end

        def api_method
          'api/v1/supplier/orders'
        end

        def token
          store.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from,
            flag: flag}
        end
      end
    end
  end
end
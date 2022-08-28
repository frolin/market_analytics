module Api
  module Wildberries
    module Stats
      class Supplies < Api::WildberriesClient
        record :user
        date :date, default: '2019-06-20'

        def execute
          response
        end

        private

        def base_url
          'https://suppliers-stats.wildberries.ru'
        end

        def api_method
          '/api/v1/supplier/incomes'
        end

        def key
          user.wb.campaigns.last.token
        end

        def type
          :get
        end

        def params
          { dateFrom: '2019-06-20',
            key: key }
        end
      end
    end
  end
end
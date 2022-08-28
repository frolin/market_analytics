module Api
  module Wildberries
    module Stats
      class Report < Api::WildberriesClient
        record :user
        date :date_from, default: '2019-06-20'
        date :date_to, default: Date.today.strftime("%d-%m-%Y")
        integer :limit, default: 100000

        def execute
          response
        end

        private

        def base_url
          'https://suppliers-stats.wildberries.ru'
        end

        def api_method
          '/api/v1/supplier/reportDetailByPeriod'
        end

        def key
          user.wb.campaigns.last.token
        end

        def type
          :get
        end

        def params
          { dateFrom: date_from,
            dateTo: date_to,
            key: key}
        end
      end
    end
  end
end
module Api
  module Wildberries
    module Ads
      class Advert < Api::WildberriesClient
        record :store
        integer :advert_id

        def execute
          response
        end

        private

        def base_url
          # https://advert-api.wb.ru/adv/v0/advert?id=4353040
          'https://advert-api.wb.ru'
        end

        def api_method
          'adv/v0/advert'
        end

        def token
          store.ads_token
        end

        def type
          :get
        end

        def params
          { id: advert_id }
        end
      end
    end
  end
end

module Api
  module Wildberries
    module Ads
      class Adverts < Api::WildberriesClient
        record :store
        string :status, default: nil
        string :offset, default: nil
        string :limit, default: nil

        def execute
          response
        end

        private

        def base_url
          'https://advert-api.wb.ru'
        end

        def api_method
          'adv/v0/adverts'
        end

        def type
          :get
        end

        def token
          store.ads_token
        end

        def params
          # order
          # create (по времени создания РК)
          # change (по времени последнего изменения РК)
          # id (по идентификатору РК)

          # Порядок:
          # create (по времени создания РК)
          # change (по времени последнего изменения РК)
          # { status: status,
          #   limit: limit,
          #   offset: offset }
          {}
        end
      end
    end
  end
end

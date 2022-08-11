module Imports
  module Ozon
    module Reports
      class Products < Api::OzonBase
        record :user
        array :sku

        def execute
          response
        end

        private

        def api_method
          'v1/report/products/create'
        end

        def type
          :post
        end

        def params
          {
            "language": "DEFAULT",
            # "offer_id": [],
            # "search": "",
            "sku": sku,
            "visibility": "ALL"
          }
        end

        def api_type
          :report
        end

      end
    end
  end
end
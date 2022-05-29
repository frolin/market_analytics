module Imports
  module YandexMarket
    class Products < ActiveInteraction::Base
      record :import
      string :format, default: 'json'

      def execute
        @found_products = 0
        @create_products = 0

        offers = Api::YandexMarket.get(params: offers_data, token: import.campaign.token)

        offers.each do |offer|
          if found_product(offer)
            @found_products += 1
            next
          end

          @create_products += 1 if create_product(offer)
        end

        puts "Found products:  #{@found_products}"
        puts "Created products:  #{@create_products}"
        puts "All offers:  #{offers.size}"
      end

      private

      def create_product(offer)
        import.products.create!(name: offer.dig('offer', 'name'),
                                sku: offer.dig('offer', 'shopSku'),
                                barcode: offer.dig('offer', 'barcodes')&.first,
                                data: offer['offer'],
                                campaign: import.campaign)
      end

      def found_product(offer)
        Product.find_by(sku: offer.dig('offer', 'shopSku'))
      end

      def offers_data
        { method: 'GET',
          url: "/campaigns/#{campaign_id}/offer-mapping-entries.#{format}",
          extract_path: ['result', 'offerMappingEntries'],
          # params: { status: 'READY', availability: 'ACTIVE' }
        }
      end

      def campaign_id
        import.campaign.number
      end

    end
  end
end
module Imports
  module YandexMarket
    class Orders < ActiveInteraction::Base
      record :import
      string :format, default: 'json'

      def execute
        @not_found_product = []

        orders_data = Api::YandexMarket.get(params: orders_stat_data, token: campaign.token)

        orders_data.each do |order_data|

          next if Order.find_by(order_id: order_data['id'])

          @import = import

          Order.transaction do
            binding.pry
            @order = create_order(order_data)

            order_data.dig('items').each { |offer|
              product = Product.find_by(sku: offer['shopSku'])

              if product.blank?
                @not_found_product << product
                raise ActiveRecord::Rollback
              end

              @order.order_products.create!(product: product)
            }
          end
        end

        puts "Не найдены товаров: #{@not_found_product.size}"
      end

      private

      def create_order(order_data)
        Order.create!(date: DateTime.parse(order_data['creationDate']),
                      order_id: order_data['id'],
                      api_data: order_data,
                      campaign: campaign,
                      import: @import)
      end

      def orders_stat_data
        { method: 'POST',
          url: "/campaigns/#{campaign_id}/stats/orders.#{format}",
          extract_path: ['result', 'orders'],
          # data: { dateFrom: "2022-01-01", dateTo: '2022-04-01'},
          params: { limit: '200' }
        }
      end

      def campaign
        @campaign ||= import.campaign
      end

      def campaign_id
        campaign.number
      end
    end
  end
end
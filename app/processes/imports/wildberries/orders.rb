module Imports
  module Wildberries
    class Orders < ActiveInteraction::Base
      record :user
      record :campaign
      date :date_from, default: DateTime.now

      def execute
        new_orders = orders.reject { |order| campaign.orders.find_by(odid: order['odid']) }

        new_orders.each do |order|
          Order.transaction do

            order = campaign.orders.new(api_data: order,
                                        date: order['date'],
                                        odid: order['odid'],
                                        srid: order['srid'])
            order.import = Import.last
            order.campaign = campaign
            order.price = price(order)
            order.save!
          end
        end

        Rails.logger.info("New orders: #{new_orders.size}")
      end

      private

      def orders
        @orders ||= Api::Wildberries::Stats::Orders.run!(user: user, date_from: format_date)
      end

      def format_date
        date_from.strftime("%Y-%m-%d")
      end

      # def not_found_orders(param)
      #   campaign.orders.where.not("api_data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
      # end

      def price(order)
        total_price = order['api_data']['totalPrice']
        discount = order['api_data']['discountPercent']

        total_price - (total_price * discount / 199)
      end
    end
  end
end

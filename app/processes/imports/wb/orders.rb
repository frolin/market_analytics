module Imports
  module Wb
    class Orders < ActiveInteraction::Base
      class NewOrdersApiError < StandardError; end

      record :user
      record :store
      date :date_from, default: DateTime.now.beginning_of_week - 7.days

      def execute
        found_orders = []
        updated_orders = []

        new_orders = orders.reject do |order|
          found_order = store.orders.wb_find(odid: order['odid'])
          found_orders << found_order if found_order

          if found_order && data_diff?(order, found_order)
            found_order.api_data.merge!(order)
            found_order.save!
            updated_orders << @found_order
          end

          found_order.present?
        end

        new_orders.each do |order|
          product = store.products.find_by(barcode: order['barcode'])
          order = store.orders.new(api_data: order,
                                   date: order['date'],
                                   odid: order['odid'],
                                   srid: order['srid'])

          order.order_products.new(product: product, store: store)
          order.save!

          new_orders << order
        end

        Rails.logger.info("Orders from api: #{orders.size}")
        Rails.logger.info("Updated orders: #{updated_orders.size}")
        Rails.logger.info("Found orders: #{found_orders.size}")
        Rails.logger.info("New orders: #{new_orders.size}")
      end

      def data_diff?(api_order, found_order)
        order_api_data = found_order.api_data.except('lastChangeDate')
        api_data_order = api_order.except('lastChangeDate')

        (api_data_order.to_a.compact - order_api_data.to_a.compact).size > 0
      end

      private

      def orders
        @orders ||= Api::Wildberries::Stats::Orders.run!(user: user, store: store, date_from: format_date)
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

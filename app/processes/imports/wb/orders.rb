module Imports
  module Wb
    class Orders < ActiveInteraction::Base
      class NewOrdersApiError < StandardError; end

      boolean :first_time, default: false
      # record :user
      record :store
      date :date_from, default: DateTime.now.beginning_of_week - 7.days

      def execute
        new_orders = []
        found_orders = []
        updated_orders = []

        raise "Error: #{orders.errors.messages}" unless orders.valid?

        orders.result.each do |order|
          found_order = store.orders.wb_find(odid: order['odid'])

          if found_order && data_diff?(order, found_order)
            found_order.api_data.merge!(order)
            found_order.save!
            updated_orders << found_order
          end

          found_orders << found_order if found_order
          new_orders << order if found_order.blank?
        end

        new_orders.each do |order|
          product = store.products.find_by(barcode: order['barcode'])
          next if product.blank?

          order = store.orders.new(api_data: order,
                                   date: order['date'],
                                   odid: order['odid'],
                                   srid: order['srid'])

          order.order_products.new(product: product, store: store)
          order.skip_notify = true if first_time
          order.save!
        end

        log = {
          orders: orders.result.size,
          updated_orders: updated_orders.size,
          found_orders: found_orders.size,
          new_orders: new_orders.size
        }

        Rails.logger.info("Orders from api report #{store.name}: #{log.to_json}")
      end

      def data_diff?(api_order, found_order)
        order_api_data = found_order.api_data.except('lastChangeDate')
        api_data_order = api_order.except('lastChangeDate')

        (api_data_order.to_a.compact - order_api_data.to_a.compact).size > 0
      end

      private

      def orders
        @orders ||= Api::Wildberries::Stats::Orders.run(store: store, date_from: format_date)
      end

      def format_date
        date_from.strftime("%Y-%m-%d")
      end

      # def not_found_orders(param)
      #   campaign.orders.where.not("api_data @> ?", { "#{param.keys.first}" => param.values.first }.to_json)
      # end

    end

  end
end

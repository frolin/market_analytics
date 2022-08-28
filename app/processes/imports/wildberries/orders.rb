module Imports
  module Wildberries
    class Orders < ActiveInteraction::Base
      record :user
      record :campaign
      date :date_from, default: DateTime.current

      def execute
        not_fond_barcodes = []
        created_orders = []

        import = campaign.imports.create!
        new_orders = orders.reject { |order| Order.wb_find(odid: order['odid']) }

        new_orders.each do |order|
          product = Product.wb_find(barcode: order['barcode'])


          if product.blank?
            not_fond_barcodes << order['barcode']
            next
          end

          Import.transaction do
            order = import.orders.create!(api_data: order, date: order['date'], campaign_id: campaign.id)
            order.api_data['price'] = price(order)
            order.save!

            product.order_products.create!(order: order, campaign: campaign)

            created_orders << { product: product, order: order }
          end

        end

        not_found_barcodes = not_fond_barcodes.uniq.map { |i| [i, not_fond_barcodes.count(i)] }.to_h

        Rails.logger.info("Not found barcodes: #{not_found_barcodes}")
        Rails.logger.info("Orders create: #{created_orders.size}")

        if created_orders.any?
          today = DateTime.current.beginning_of_day..DateTime.current.end_of_day

          today_orders = created_orders.select { |co| today.cover?(co[:order].date) }
          Telegram::ImportReport.send_message(user, today_orders)
        end
      end

      private

      def orders
        @orders ||= Api::Wildberries::Stats::Orders.run!(user: user, date_from: format_date)
      end

      def format_date
        date_from.strftime("%Y-%m-%d")
      end

      def price(order)
        total_price = order['api_data']['totalPrice']
        discount = order['api_data']['discountPercent']

        total_price - (total_price * discount / 199)
      end
    end
  end
end

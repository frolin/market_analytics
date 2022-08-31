module Imports
  module Wildberries
    class Sales < ActiveInteraction::Base
      record :user
      record :campaign
      date :date_from, default: Date.current.beginning_of_week

      def execute
        new_sell_log = []
        not_fond_orders = []

        # import = campaign.imports.create!

        new_sales = sales.reject { |sale| Sell.wb_find(odid: sale['odid']) }

        Rails.logger.info("Found sales count: #{new_sales.count}")

        new_sales.each do |sell|
          order = Order.wb_find(odid: sell['odid']) || Order.wb_find(srid: sell['srid'])

          if order.blank?
            not_fond_orders << sell['odid']
            next
          end

          Import.transaction do
            sell = order.create_sell(api_data: sell, date: sell['date'])

            new_sell_log << sell
          end
        end

        Rails.logger.info("Sales create: #{new_sell_log.size}")
        Rails.logger.info("Not found orders: odid: #{not_fond_orders}")
      end

      private

      def sales
        @sales ||= Api::Wildberries::Stats::Sales.run!(user: user, date_from: date_from.strftime("%Y-%m-%d"))
      end

    end
  end
end

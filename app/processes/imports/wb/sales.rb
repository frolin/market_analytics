module Imports
  module Wb
    class Sales < ActiveInteraction::Base
      record :user
      record :store
      date :date_from, default: Date.current.beginning_of_week - 7.days

      def execute
        new_sales = []
        updated_sales = []
        found_sales = []
        not_found_product = []
        # import = campaign.imports.create!

        sales.each do |sale|
          @found_sale = store.sales.wb_find(saleID: sale['saleID'])

          if @found_sale && data_diff?(sale)
            @found_sale.api_data.merge!(sale)
            @found_sale.state = @found_sale.canceled? ? :canceled : :sold
            @found_sale.save!

            updated_sales << @found_sale

            next
          elsif @found_sale
            found_sales << sale
            next
          end

          order = find_order(sale)
          product = store.products.find_by(barcode: sale['barcode'])
          if product.blank?
            not_found_product << sale
            next
          end

          store.transaction do
            sale = store.sales.new(api_data: sale, date: sale['date'])
            sale.order = order if order.present?
            sale.state = sale.canceled? ? :canceled : :sold
            sale.sale_products.new(product: product)
            sale.save!
            new_sales << sale
          end
        end

        Rails.logger.info("Api Sales count: #{sales.count}")
        Rails.logger.info("Found sales count: #{found_sales.count}")
        Rails.logger.info("NOT FOUND PRODUCT: #{not_found_product.count}")

        Rails.logger.info("New sales count: #{new_sales.count}")
        Rails.logger.info("Sales create: #{new_sales.size}")
        Rails.logger.info("Sales updated: #{updated_sales.size}")
      end

      private

      def data_diff?(sale)
        return unless @found_sale
        sale_api_data = @found_sale.api_data.except('lastChangeDate')
        api_data_sale = sale.except('lastChangeDate')

        (api_data_sale.to_a.compact - sale_api_data.to_a.compact).size > 0
      end

      def sales
        @sales ||= Api::Wildberries::Stats::Sales.run!(user: user, store: store, date_from: date_from.strftime("%Y-%m-%d"))
      end

      def find_order(sale)
        Order.wb_find(odid: sale['odid']) || Order.wb_find(gNumber: sale['gNumber']) || Order.wb_find(srid: sale['srid'])
      end

    end
  end
end

module Imports
  module Wb
    class Sales < ActiveInteraction::Base
      boolean :first_time, default: false
      record :store
      date :date_from, default: DateTime.now - 3.month

      def execute
        new_sales = []
        updated_sales = []
        found_sales = []
        not_found_product = []
        # import = campaign.imports.create!

        raise "Error: #{sales.errors.messages}" unless sales.valid?

        sales.result.each do |sale|
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

            sale.skip_notify = true if first_time

            sale.save!
            new_sales << sale
          end
        end

        log = {
          sales_count_from_api: sales.result.count,
          found_sales: found_sales.count,
          not_found_product: not_found_product.count,
          new_sales: new_sales.count,
          update_sales: updated_sales.size
        }

        Rails.logger.info("Sales from api report #{store.name}: #{log.to_json}")
      end

      private

      def data_diff?(sale)
        return unless @found_sale
        sale_api_data = @found_sale.api_data.except('lastChangeDate')
        api_data_sale = sale.except('lastChangeDate')

        (api_data_sale.to_a.compact - sale_api_data.to_a.compact).size > 0
      end

      def sales
        @sales ||= Api::Wildberries::Stats::Sales.run(store: store, date_from: date_from.strftime("%Y-%m-%d"))
      end

      def find_order(sale)
        Order.wb_find(odid: sale['odid']) || Order.wb_find(gNumber: sale['gNumber']) || Order.wb_find(srid: sale['srid'])
      end

    end
  end
end

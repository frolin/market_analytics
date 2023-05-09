module Imports
  module Wb
    class DetailReports < ActiveInteraction::Base
      record :store

      def execute
        created = 0

        reports.each do |report|
          next if store.report_sales.find_by(rrd_id: report['rrd_id'])

          unless store.sale_reports.find_by(date_from: report['date_from'], date_to: report['date_to'])
            store.sale_reports.create!(store: store, date_from: report['date_from'], date_to: report['date_to'])
          end

          sale_report =
            if sr = store.sale_reports.find_by(date_from: report['date_from'], date_to: report['date_to'])
              sr
            else
              store.sale_reports.create!(store: store,
                                         date_from: report['date_from'],
                                         date_to: report['date_to'],
              )
            end

          product = store.products.find_by(sku: report['nm_id'])
          supply = Supply.find_by(name: report['gi_id'])

          data = report.symbolize_keys
          store.report_sales.create!(**data, product: product, supply: supply, sale_report: sale_report)

          created += 1
        end

        puts "created: #{created}"
      end

      private

      def reports
        @reports ||= Api::Wildberries::Stats::Reports.run!(store: Store.last)
      end
    end
  end
end
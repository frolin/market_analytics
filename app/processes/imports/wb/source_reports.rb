module Imports
  module Wb
    class SourceReports < ActiveInteraction::Base
      # URL_PATTERN = "https://docs.google.com/spreadsheets/d/e/1BDJ6ta6ah6lUFeJGUbZOMCkC9lUhULn7z96vC7TnLUA/pub?output=csv&gid=0}"
      # URL = '1BDJ6ta6ah6lUFeJGUbZOMCkC9lUhULn7z96vC7TnLUA'
      integer :source_report_id
      integer :store_id

      def execute
        url = xls_export_url(source_report.google_doc_id)
        # spreadsheet = Roo::Spreadsheet.open(url, extension: :xlsx)
        excel_data = GetData::Excel.call(file_path: url)

        excel_data.each do |page, page_data|
          page_data.each_with_index do |data, idx|
            next if idx == 0 # ignore headers
            report_number = data['№ отчета'].to_i
            week_report = ::Wb::Report::FinanceWeek.find_by(number: report_number)
            next if week_report.present?

            ::Wb::Report::FinanceWeek.create!(number: report_number, data: data,
                                              store: store, start_date: data['Дата начала'].to_date,
                                              end_date: data['Дата конца'].to_date)
          end

        end
      end

      private

      def source_report
        @source_report ||= SourceReport.find(source_report_id)
      end

      def store
        @store ||= Store.find(store_id)
      end


      def xls_export_url(google_doc_id)
        "https://docs.google.com/spreadsheets/d/#{google_doc_id}/export?format=xlsx"
      end
    end
  end
end
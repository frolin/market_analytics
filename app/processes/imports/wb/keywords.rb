module Imports
  module Wb
    class Keywords < ActiveInteraction::Base

      def execute
        # url = xls_export_url(SHEET_ID)
        # spreadsheet = Roo::Spreadsheet.open(url, extension: :xlsx)
        csv_source = Rails.root.join("lib", "tasks", "requests.csv")

        CSV.foreach(csv_source, headers: [:name, :requests_count]).each_slice(250) do |row|
          Keyword.insert_all(row.map(&:to_h))
        end
      end

      private

    end
  end
end

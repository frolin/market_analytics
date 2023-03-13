module GetData
  class Excel
    def self.call(file_path:, headers_row_num: 1, sheet_name: nil)
      result = {}
      workbook = Roo::Spreadsheet.open(file_path, extension: :xlsx)

      # sheets = sheet_name.present? ? [workbook.sheet(sheet_name)] : workbook.sheets

      workbook.each_with_pagename do |name, sheet|
        next if sheet_name.present? && sheet_name != name

        worksheet = workbook.sheet(name)
        headers = worksheet.row(headers_row_num)

        puts "Reading: #{name}"
        @current_row = 0
        result[name] = sheet.map do |row|
          @current_row += 1

          formatted_row = row.map(&:to_s)

          Hash[*headers.zip(formatted_row).flatten]
        end

        puts "Read #{@current_row} rows"
      end

      result
    end
  end
end

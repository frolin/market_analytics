require "google_drive"

module Export
  class GoogleDrive < ActiveInteraction::Base
    SPREADSHEET = '1HbS2Pt1veAtXGOCHLCeTpj9QPYpg1sjg4KZEpx08btg'
    DEFAULT_TEMPLATE = 'Шаблон авто'
    START_ROW = 4

    record :supply

    def execute
      if worksheet(supply.name).present?
        worksheet = worksheet(supply.name)
      else
        worksheet_dup
        worksheet = session.spreadsheet_by_key(SPREADSHEET).worksheets.last
        worksheet.title = supply.name
        worksheet.index = 0
      end

      supply.supply_products.each_with_index do |sp, col_num|
        worksheet[START_ROW + col_num, 1] = sp.product.name
        worksheet[START_ROW + col_num, 2] = sp.count
      end

      worksheet.save
    end

    private

    def session
      @session ||= ::GoogleDrive::Session.from_service_account_key("config/red-price-google.json")
    end

    def worksheet(title)
      @worksheet ||= session.spreadsheet_by_key(SPREADSHEET).worksheet_by_title(title)
    end

    def worksheet_dup
      @@worksheet = session.spreadsheet_by_key(SPREADSHEET).worksheet_by_title(DEFAULT_TEMPLATE).duplicate
    end

  end
end
require "selenium-webdriver"

module Wb
  class SearchBySku < ActiveInteraction::Base
    string :sku

    def execute
      Browser.new("https://www.wildberries.ru/catalog/#{sku}{/detail.aspx?targetUrl=GP").run
    end

  end
end
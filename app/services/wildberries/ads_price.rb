require "selenium-webdriver"

module Wildberries
  class AdsPrice < ActiveInteraction::Base
    string :q

    def execute
      @wait = Selenium::WebDriver::Wait.new(timeout: 60)
      search

      JSON.parse(@page.local_storage['advertCatalog'])

    ensure
      @page.quit
    end

    private

    def search
      @page = Browser.new('https://www.wildberries.ru/').run

      search_form = @page.find_element(css: '#searchInput')
      search_form.send_keys(q)
      search_form.send_keys(:return)
    end
  end
end

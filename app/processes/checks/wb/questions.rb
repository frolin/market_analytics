require "selenium-webdriver"

module Checks
  module Wb
    class Questions < ActiveInteraction::Base
      XPATH_CLASS = "//ul[contains(@class,'Questions-content__')]"
      record :user

      def execute
        wait = Selenium::WebDriver::Wait.new(timeout: 60)

        begin
          result = []

          @page = Browser.new('https://seller.wildberries.ru/').run

          # if !page.manage.all_cookies.pluck(:name).include?('WBToken')
          # @page.manage.add_cookie(name: "WBToken", value: user.settings.wb_auth_token)
          # @page.manage.add_cookie(name: "x-supplier-id-external", value: user.settings.supplier_token)
          # @page.manage.add_cookie(name: "locale", value: 'ru')

          #   page.execute_script("location.reload()")
          #
          # end
          sleep 1
          @page.execute_script("window.scrollBy(0,1000)")
          wait.until { element_is_displayed?(type: :xpath, name: XPATH_CLASS ) }
          qa = @page.find_element(xpath: XPATH_CLASS).find_elements(css: 'li').map { |p| p.text }.compact_blank

          if qa.any?
            Telegram::Qa.call(user, qa)
          end

        ensure
          @page.quit
        end
      end

      private

      def element_is_displayed?(type:, name:)
        @page.find_elements(type => name).present? ? true : false
      end

    end
  end
end
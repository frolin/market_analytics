require "selenium-webdriver"

module Checks
  module Wb
    class Ads < ActiveInteraction::Base
      PRODUCT_XPATH = '/html/body/app-root/div/div[1]/div[2]/div/app-campaigns-list/div/div[2]/app-datatable/div[2]/div/div[3]/div'
      BUDGET_PATH = '/html/body/app-root/div/div[1]/div[2]/div/app-edit-auction-campaign/div/form/div[1]/div/div/div[1]'

      record :user

      def execute
        wait = Selenium::WebDriver::Wait.new(timeout: 60)

        begin
          result = []

          @page = Browser.new('https://seller.wildberries.ru/').run
          @page.get('https://cmp.wildberries.ru/campaigns/list/active')

          # if !page.manage.all_cookies.pluck(:name).include?('WBToken')
          #   page.manage.add_cookie(
          #     name: "WBToken",
          #     value: user.settings.wb_auth_token
          #   )
          #
          #   page.execute_script("location.reload()")
          #   sleep 5
          # end

          wait.until { element_is_displayed?(type: :xpath, name: PRODUCT_XPATH) }
          products = @page.find_elements(xpath: PRODUCT_XPATH).map { |p| p.text }.compact_blank


          products.each_with_index do |product, i|
            next if i == 0

            wait.until { element_is_displayed?(type: :xpath, name: "//*[text()=#{product}]") }
            product_name = @page.find_element(:xpath, "//*[text()=#{product}]")
            product_name.click

            wait.until { element_is_displayed?(type: :xpath, name: BUDGET_PATH) }
            budget = @page.find_element(xpath: BUDGET_PATH).text

            result << { budget: budget }

            @page.navigate.back
          end


          if products.blank?
            @page.quit

            raise StandardError
          end

          Telegram.bot.send_message(chat_id: user.settings.tg_chat_id, text: "#{products}")
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
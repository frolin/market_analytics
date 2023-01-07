require "selenium-webdriver"

module Wb
  class SearchByQuery < ActiveInteraction::Base
    INPUT_FORM = '#searchInput'
    PROMO = '.product-card__tip-promo'
    string :q
    string :sku

    def execute
      ads = {}
      data_all = {}
      @wait = Selenium::WebDriver::Wait.new(timeout: 60)

      search

      begin
        loop do
          puts "Start new iteration with query: \'#{q}\' for sku: \'#{sku}\'"

          @wait.until do

            if element_is_displayed?(type: :css, name: "#c#{sku}")
              found_product = @page.find_element(css: "#c#{sku}")

              if ads?(found_product)
                puts "Found ads at page #{current_page_number}"
                ads = data(found_product)

                goto_next_page
                next
              end

              puts "Found product at page #{current_page_number}"
              data_all = data(found_product)

              return data_all.merge!(ads)
            else
              puts "goto next page num from: #{current_page_number} to: #{next_page_number} "

              if next_page.present?
                goto_next_page
              else
                return "no next page, exit"
              end
            end
          end
        end

      ensure
        @page.quit
      end


    end

    private

    def search
      @page = Browser.new('https://www.wildberries.ru/').run
      search = @wait.until {
        element_is_displayed?(type: :css, name: INPUT_FORM)
      }

      if search
        search_form = @page.find_element(css: '#searchInput')
        search_form.send_keys(q)
        search_form.send_keys(:return)
      else
        raise Selenium::WebDriver::Error::NoSuchElementError
      end

    end

    def element_is_displayed?(type:, name:)
      @page.find_elements(type => name).present? ? true : false
    end

    def next_page
      @page.find_elements(css: 'a.pagination-item').select { |el| el.text == next_page_number }.first
    end

    def goto_next_page
      if next_page.present?
        next_page.click
      else
        errors.add(:base, 'Next page not found')
      end
    end

    def current_page_number
      @page.find_element(css: 'span.pagination-item').text
    end

    def next_page_number
      (current_page_number.to_i + 1).to_s
    end

    def data(product)
      position = product.attribute("data-card-index").to_i + 1

      data = { page_number: current_page_number.to_i,
               absolute_index: absolute_index(position),
               position: position,
               brand_name: product.find_element(css: '.brand-name').text,
               product_name: product.find_element(css: '.goods-name').text,
               url: @page.current_url,
               ads: false
      }

      # if ads?(product)
      #   adv = JSON.parse(@page.local_storage['advertCatalog'])
      #
      #   data.merge!({ ads: true,
      #                 **adv['advData'] })
      # end

      data
    end

    def absolute_index(position)
      current_page_number == '1' ? current_page_number.to_i + position : current_page_number.to_i * 100 + position
    end

    def ads?(found_product)
      found_product.find_element(css: PROMO).text == 'Реклама'
    end

  end
end
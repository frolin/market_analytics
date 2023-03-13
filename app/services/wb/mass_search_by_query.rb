require "selenium-webdriver"

module Wb
  class MassSearchByQuery < ActiveInteraction::Base
    INPUT_FORM = '#searchInput'
    PROMO = '.product-card__tip.product-card__tip--action'
    MAX_PAGE_NUMBER = '5'

    record :keyword

    def execute
      ads = {}
      data_all = {}
      @wait = Selenium::WebDriver::Wait.new(timeout: 60)

      search

      begin
        loop do
          puts "Start new iteration with query: #{keyword.name}"

          while @page.find_elements(css: ".product-card.j-card-item").count != 100
            sleep(0.3)
            @page.execute_script("window.scrollBy(0,100)")
          end

          @page.find_elements(css: ".product-card.j-card-item").each_with_index do |product, idx|
            return if current_page_number == MAX_PAGE_NUMBER
            product_data = data(product, idx + 1)
            keyword_result = KeywordResult.find_by(sku: product_data[:sku])

            byebug
            if changed_position?(keyword_result, product_data)
              keyword_result.update!(data: product_data)

              next
            elsif keyword_result
              next

            else
              KeywordResult.create!(sku: product_data.delete(:sku),
                                    keyword_id: keyword.id,
                                    data: product_data)
            end
          end

          puts "goto next page num from: #{current_page_number} to: #{next_page_number} "

          if next_page.present?
            goto_next_page
          else
            return "no next page, exit"
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
        sleep(3)

        search_form.send_keys(keyword.name)
        search_form.send_keys(:return)
      else
        raise Selenium::WebDriver::Error::NoSuchElementError
      end

    end

    def changed_position?(keyword_result, product_data)
      keyword_result.present? && product_data[:position].present? &&
        keyword_result.absolute_position != product_data[:absolute_position]
    end

    def element_is_displayed?(type:, name:)
      @page.find_elements(type => name).present? ? true : false
    end

    def next_page
      @page.find_elements(css: 'a.pagination-item').select { |el| el.text == next_page_number }.first
    end

    def goto_next_page
      next_page.click
    end

    def current_page_number
      @page.find_element(css: '.pagination__item.active').text
    end

    def next_page_number
      (current_page_number.to_i + 1).to_s
    end

    def data(product, position)
      { page_number: current_page_number.to_i,
        absolute_position: absolute_index(position),
        position: position,
        brand_name: product.find_element(css: '.brand-name').text,
        product_name: product.find_element(css: '.goods-name').text,
        url: @page.current_url,
        ads: ads?(product),
        sku: product.attribute('id').gsub('c', ''),
        description: product.find_element(css: 'a').text.split("\n"),
        link: product.find_element(css: 'a').attribute('href') }
    end

    def absolute_index(position)
      if current_page_number == '1'
        position
      else
        current_page_number.to_i * 100 + position
      end
    end

    def ads?(product)
      product.find_element(css: PROMO).text.downcase == 'промотовар'
    rescue
      false
    end

  end
end
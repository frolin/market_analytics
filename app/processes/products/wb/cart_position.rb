# module Products
#   module WB
#     class CartPosition < ActiveInteraction::Base
#       record :product
#       string :search
#
#       WB_SEARCH = "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=#{search}"
#
#       def execute
#         page = Browser.new(WB_SEARCH).run
#         position = page.find_element(xpath: '//*[@id="c111885412"]').attribute("data-card-index")
#
#
#         product.keywords.find_by(name: search)
#       end
#     end
#   end
# end
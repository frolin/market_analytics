module Imports
  class FirstTime < ActiveInteraction::Base
    include ActiveInteraction::Extras::ErrorAndHalt

    integer :user_id
    integer :campaign_id

    def execute
      return if stocks.invalid?

      stocks.result.each do |stock|
        next if Product.wb_find(barcode: stock['barcode'])

        new_stock(stock)
      end
    end

    private

    def user
      @user ||= User.find(user_id)
    end

    def campaign
      @campaign ||= Campaign.find_by(id: campaign_id)
    end

    def new_stock(stock)
      campaign.products.new do |p|
        p.barcode = stock['barcode']
        p.user_id = user.id

        p.stocks.new do |s|
          s.api_data = stock
          s.api_data.merge!(url: "https://www.wildberries.ru/catalog/#{stock['nmId']}/detail.aspx?targetUrl=GP")
        end

        p.save!
      end
    end

    def stocks
      @stocks ||= Api::Wildberries::Stats::Stocks.run(user: user, campaign: campaign, date_from: date)
    end

    def date
      DateTime.current.advance(days: -3).strftime("%Y-%m-%d")
    end
  end
end
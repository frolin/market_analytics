module Checks
  module Wb
    class AdsApi < ActiveInteraction::Base
      record :store

      def execute
        ads_list = Api::Wildberries::Ads::Adverts.run!(store: store)

        ads_list.each do |ad|
          @found_ad = Ad.find_by(advert_id: ad['advertId'])
          ads_data = Api::Wildberries::Ads::Advert.run!(advert_id: ad['advertId'], store: store)['params'].first
          ads_data.transform_keys! { |key| key.underscore }

          if @found_ad
            @found_ad.update! status: (ad['status']) if @found_ad.read_attribute_before_type_cast(:status) != ad['status']
            @found_ad.update!(data: ads_data) if request_data_diff?(ads_data)
          else
            new_ads = Ad.new(advert_id: ad['advertId'],
                             ad_type: ad['type'],
                             status: ad['status'],
                             create_time: ad['createTime'],
                             change_time: ad['changeTime'],

            )

            new_ads.data = ads_data
            new_ads.store = store
            new_ads.save!
          end
        end
      end

      private

      def request_data_diff?(data)
        data.each do |key, value|
          return true if @found_ad.data[key] != value
        end

        false
      end
    end
  end
end
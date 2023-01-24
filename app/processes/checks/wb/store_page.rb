require "selenium-webdriver"

module Checks
  module Wb
    class StorePage < ActiveInteraction::Base
      DIFF_ATTRS = %i(name rating reviews products_count sells_count
      delivered_count defective_count ip ogrnip).freeze

      integer :store_id
      integer :user_id, default: nil
      boolean :first_time, default: false

      def execute
        page_data = Parse::Wb::Store.run(store_id: store_id)
        raise 'Something went wrong with request' unless page_data.valid?

        request_data = page_data.result

        if store.name.blank?
          store.update!(name: request_data[:name])
        end

        if first_time || request_data_diff?(request_data)
          @request = Request::Store.new(source: store)
          @request.data = request_data
          @request.save!
        end

        if store.images.count == 0 && page_data.logo.present?
          logo = store.images.new

          logo.image_remote_url = page_data.logo
          logo.image_derivatives! if logo.image_changed?
          logo.save!
        end

        if first_time
          Telegram::Notifications::StoreDataNew.new(request: @request,
                                                    user: user || store.users.admin,
                                                    first_time: true).call
        end
      end

      private

      def last_request_data
        store.requests.last&.data&.symbolize_keys
      end

      def request_data_diff?(data)
        return if data.size != last_request_data.size

        data.each do |key, value|
          next unless key.in?(DIFF_ATTRS)

          return true if last_request_data[key] != value
        end

        false
      end

      def store
        @store ||= Store.find(store_id)
      end

      def user
        return if user_id.blank?

        @user ||= User.find(user_id)
      end

      def product
        @product ||= Product.find(product_id)
      end

    end
  end
end
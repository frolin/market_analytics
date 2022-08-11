module Imports
  module Wildberries
    class Supplies < Api::WildberriesClient
      record :user
      symbol :status, default: :active

      def execute
        response
      end

      private

      def api_method
        'supplies'
      end

      def type
        :get
      end

      def params
        {}
        # { status: status }
      end

      def system_name
        :wildberries
      end

    end
  end
end
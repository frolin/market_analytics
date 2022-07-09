module Imports
  module Wildberries
    class Supplies < Api::BaseClient
      record :user

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
      end

      def system_name
        :wildberries
      end

    end
  end
end
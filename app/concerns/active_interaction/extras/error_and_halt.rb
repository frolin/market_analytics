# frozen_string_literal: true

module ActiveInteraction
  module Extras
    module ErrorAndHalt
      extend ActiveSupport::Concern

      included do
        set_callback :execute, :around, lambda { |_interaction, block|
          catch :halt_error do
            block.call
          end
        }
      end

      def error_and_halt!(key, message)
        errors.add(key, message)

        throw :halt_error, errors
      end

      def model_errors_and_halt!(model)
        model.errors.details.each do |key, value|
          value.each { |err| errors.add(key, err[:error].to_s) }
        end

        throw :halt_error, errors
      end

      def halt_if_errors!
        throw(:halt_error, errors) if errors.any?
      end
    end
  end
end

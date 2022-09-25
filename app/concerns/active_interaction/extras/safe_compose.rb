module ActiveInteraction
  module Extras
    module SafeCompose
      extend ActiveSupport::Concern

      # https://github.com/AaronLasseigne/active_interaction/blob/main/lib/active_interaction/concerns/runnable.rb#L61
      # заменил, чтобы не рейзить ошибку при невалидном процессе

      def compose_safe(other, *args)
        outcome = other.run(*args)

        return outcome.result unless outcome.invalid?

        errors.merge!(outcome.errors)

        throw(:halt_error, errors)
      end
    end
  end
end

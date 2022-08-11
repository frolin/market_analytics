module Api
  class BaseClient < ActiveInteraction::Base
    CONNECT_TTL = 3

    API_VERSION = 'v2'.freeze
    KEY = ''.freeze
    API_URI = "https://suppliers-api.wildberries.ru/api/#{API_VERSION}/".freeze
    API_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NJRCI6IjdiMDE0ZTdmLTk1YWQtNDRjNy04NWMxLTA1NDhmNzdhN2U1NSJ9.kHZr_Ee5LHeUqySbnHKWANg8dTJlW_h-0R3ORmpf3dA'

    HEADERS = {
      'Authorization' => API_KEY
    }.freeze

    private

    def response
      # return true unless Rails.env.production?
      Rails.logger.info(message: "[API] request Method: #{api_method}, params: #{base_params.merge(params).to_s}")

      response = if type == :get
                   connection.get(api_method, base_params.merge!(params))
                 elsif type == :post
                   connection.post(api_method) do |request|
                     request.body = params
                     request.options.timeout = CONNECT_TTL
                     request.options.open_timeout = CONNECT_TTL
                   end
                 end


      parsed_body = response.body

      Rails.logger.info(message: "[API] Got response. Body: #{parsed_body.to_s}")

      if parsed_body['error'].present?
        errors.add(:base, "Response error: method: #{api_method}")
        error_log(parsed_body['errorText'], parsed_body['additionalErrors'])
      end

      parsed_body
    rescue StandardError => e
      error_log(e, parsed_body=nil)
      # Sentry.capture_exception(e)
    end

    def connection
      @connection ||= Faraday.new(API_URI, headers: HEADERS) do |f|
        f.request :json # encode req bodies as JSON and automatically set the Content-Type header
        f.response :json # decode response bodies as JSON
      end
    end

    def error_log(errors, additional_errors=nil)
      Rails.logger.error(message: "[API] Error response",
                         payload: { api_method: api_method,
                                    params: base_params.merge(params),
                                    errors: errors,
                                    additional_errors: additional_errors,
                                    system: system_name })
    end

    def api_method
      raise NotImplementedError, 'Define in subclass'
    end

    def params
      raise NotImplementedError, 'Define in subclass'
    end

    def system_name
      raise NotImplementedError, 'Define in subclass'
    end

    def type
      raise NotImplementedError, 'Define in subclass'
    end

    def base_params
      {}
    end
  end
end

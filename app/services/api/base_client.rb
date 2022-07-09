module Api
  class BaseClient < ActiveInteraction::Base
    CONNECT_TTL = 3

    API_VERSION = 'v2'.freeze
    KEY = ''.freeze
    API_URI = "https://suppliers-api.wildberries.ru/api/#{API_VERSION}/".freeze

    HEADERS = {
      'Content-Type' => 'application/json',
      'Authorization' => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NJRCI6ImRjMWFlYjFmLWUxOTAtNDBlOS04Y2ZhLTY5N2U2YmNhODgxNSJ9.xk9MR4I_j0eLQrEgMpHx3pgPwyPs2LQpa7v3n1rr_B4"
    }.freeze

    private

    def response
      # return true unless Rails.env.production?

      Rails.logger.info(message: "[API] request Method: #{api_method}, params: #{base_params.merge(params).to_s}")
      binding.pry

      response = if type == :get
                   connection.get(api_method, params)
                 elsif type == :post
                   connection.post(api_method) do |request|
                     request.body = params
                     request.options.timeout = CONNECT_TTL
                     request.options.open_timeout = CONNECT_TTL
                   end
                 end

      parsed_body = JSON.parse(response.body)
      Rails.logger.info(message: "[API] Got response. Body: #{parsed_body.to_s}")

      if parsed_body['errors'].present?
        errors.add(:base, "Response error: method: #{api_method}")
        error_log(parsed_body['errors'], parsed_body['request.id'])
      end

      parsed_body
    rescue StandardError => e
      error_log(e, parsed_body)
      Sentry.capture_exception(e)
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

    def connection
      @connection ||= Faraday.new(API_URI) do |conn|
        conn.request :json # encode req bodies as JSON and automatically set the Content-Type header
        conn.request :retry # retry transient failures
        conn.response :json # decode response bodies as JSON
        conn.headers HEADERS
        conn.adapter :net_http # adds the adapter to the connection, defaults to `Faraday.default_adapter`
      end
    end

    def error_log(errors, request_id)
      Rails.logger.error(message: "[API] Error response",
                         payload: { api_method: api_method,
                                    params: base_params.merge(params),
                                    request_id: request_id,
                                    errors: errors,
                                    system: system_name })
    end

  end
end

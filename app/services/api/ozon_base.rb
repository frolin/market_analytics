module Api
  class OzonBase < ActiveInteraction::Base
    CONNECT_TTL = 3

    CLIENT_ID = '357090'.freeze
    API_URI = "https://api-seller.ozon.ru/".freeze
    API_KEY = 'e5e5406b-a3d2-42b3-8a93-d4593a33b9af'

    HEADERS = {
      'Api-key' => API_KEY,
      'Client-id' => CLIENT_ID
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

      if api_type == :report
        code = parsed_body.dig('result', 'code')
        report = connection.post("v1/report/info", code: code)
        file_url = report.body.dig('result', 'file')
        csv = connection.get(file_url).body
        csv.gsub!('"', "'")
        CSV.parse(csv, headers: true).each do |row|
          p row
        end
      end

      Rails.logger.info(message: "[API] Got response. Result count: #{parsed_body['result'].count}")

      if parsed_body['error'].present?
        errors.add(:base, "Response error: method: #{api_method}")
        error_log(parsed_body['errorText'], parsed_body['additionalErrors'])
      end

      parsed_body['result']
    rescue StandardError => e
      error_log(e, parsed_body = nil)
      # Sentry.capture_exception(e)
    end

    def connection
      @connection ||= Faraday.new(API_URI, headers: HEADERS) do |f|
        f.request :json # encode req bodies as JSON and automatically set the Content-Type header
        f.response :json # decode response bodies as JSON
      end
    end

    def error_log(errors, additional_errors = nil)
      Rails.logger.error(message: "[API] Error response",
                         payload: { api_method: api_method,
                                    params: base_params.merge(params),
                                    errors: errors,
                                    additional_errors: additional_errors,
                                    system: 'ozon' })
    end

    def api_method
      raise NotImplementedError, 'Define in subclass'
    end

    def params
      raise NotImplementedError, 'Define in subclass'
    end

    def type
      raise NotImplementedError, 'Define in subclass'
    end

    def api_type
      raise NotImplementedError, 'Define in subclass'
    end

    def base_params
      {}
    end
  end
end

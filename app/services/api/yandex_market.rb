module Api
	class YandexMarket
		BASE_URL = "https://api.partner.market.yandex.ru/v2/".freeze

		def self.get(params:, token:)
			new(params[:url], params[:params], params[:extract_path], params[:method], params[:data], token).get
		end

		def initialize(url, params, extract_path, method, data, token)
			@token = token
			@oauth_client_id = ENV['YANDEX_OAUTH_CLIENT_ID']

			@format = :json

			@url = url
			@params = params || {}
			@extract_path = extract_path
			@method = method
			@data = data

			@result = []
			@page_num = 1
		end

		def get
			get_data
			@result << data

			while next_page? do
				@page_num += 1

				get_data
				@result << data

				print_log
				break unless next_page?
			end

			@result.flatten
		end

		private

		def get_data
			@response = case @method
			            when 'GET'
				            connection.get @url, @params do |request|
					            request.headers["Authorization"] = "OAuth oauth_token=#{@token}, oauth_client_id=#{@oauth_client_id}"
				            end
									when 'POST'
				            connection.post @url do |request|
					            request.headers["Authorization"] = "OAuth oauth_token=#{@token}, oauth_client_id=#{@oauth_client_id}"
					            request.headers['Content-Type'] = 'application/json'
					            request.body = @data.to_json if @data
					            @params.each { |name, value| request.params[name] = value }
				            end
			            end

			@params.merge!(page_token: page_token) if next_page?
		end

		def connection
			Faraday.new(url: BASE_URL) do |c|
				c.adapter Faraday.default_adapter
				c.use Faraday::Request::UrlEncoded
				c.use Faraday::Response::Logger
				c.use Faraday::Response::RaiseError
			end
		end

		def body
			JSON.parse(@response.body)
		end

		def data
			body.dig(*@extract_path)
		end

		def page_token
			body.dig('result', 'paging', 'nextPageToken')
		end

		def next_page?
			page_token.present?
		end

		def print_log
			puts "----------------------------------------------\n"
			puts "Page Number: #{@page_num}"
			puts "Next page_token: #{page_token}" if page_token
			puts "Last page" unless next_page?

			sleep 1
			puts 'Sleep...'
			puts "----------------------------------------------\n"
		end
	end
end

require 'net/http'
require 'net/http'
require 'brasilfone_api/http_api_handler/service_uri'
require 'uri'
require 'xmlhasher'

module BrasilfoneAPI
  module HttpAPIHandler
    class << self
      def send_request_for_service(service, parameters = {})
        uri = BrasilfoneAPI::HttpAPIHandler::ServiceURI.uri_for_service(
          service,
          parameters
        )

        url = URI.parse(uri)
        request = Net::HTTP::Get.new(url.to_s)
        response = Net::HTTP.start(url.host, url.port) do |http|
          http.request(request)
        end
        XmlHasher.parse(response.body)
      end
    end
  end
end

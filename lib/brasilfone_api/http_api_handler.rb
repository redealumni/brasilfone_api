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

        request = Net::HTTP::Get.new(uri)
        response = Net::HTTP.start(uri.host, uri.port) do |http|
          http.request(request)
        end
        XmlHasher.parse(response.body)
      end
    end
  end
end

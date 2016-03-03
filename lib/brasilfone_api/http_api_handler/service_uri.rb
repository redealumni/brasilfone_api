module BrasilfoneAPI
  module HttpAPIHandler
    module ServiceURI
      class << self
        def uri_for_service(service, parameters)
          builder = URIBuilder.new(service, parameters)
          builder.build
          builder.uri
        end
      end

      class URIBuilder
        require 'brasilfone_api/http_api_handler/uri_constants'
        attr_accessor :uri

        def initialize(service, parameters)
          @service = service
          @parameters = parameters
          @uri = nil
        end

        def build
          service_exists = URIConstants::SERVICES_NAMES.key?(@service)
          raise 'Invalid Service' unless service_exists
          @parameters.each do |param, _value|
            param_exists = URIConstants::PARAMETERS_NAMES.key?(param)
            raise 'Invalid Paramenters' unless param_exists
          end

          @uri = URIConstants::BRASILFONE_BASE_URI
          append_service
          append_credentials
          append_parameters
        end

        private

        def append_service
          @uri += "&service=#{URIConstants::SERVICES_NAMES[@service]}"
        end

        def append_credentials
          username = BrasilfoneAPI.config.username
          password = BrasilfoneAPI.config.password
          @uri += "&username=#{username}&password=#{password}"
        end

        def append_parameters
          @parameters.each do |param, value|
            param_name = URIConstants::PARAMETERS_NAMES[param]
            uri_param = "&#{param_name}=#{value}"
            @uri += uri_param
          end
        end
      end
    end
  end
end

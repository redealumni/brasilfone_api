module BrasilfoneAPI
  module HttpAPIHandler
    module ServiceURI
      require 'uri'

      class << self
        def uri_for_service(service, parameters)
          builder = URIBuilder.new(service, parameters)
          builder.build
        end
      end

      class URIBuilder
        require 'brasilfone_api/http_api_handler/uri_constants'

        def initialize(service, parameters)
          @service = service
          @parameters = parameters
        end

        def build
          service_exists = URIConstants::SERVICES_NAMES.key?(@service)
          raise 'Invalid Service' unless service_exists
          @parameters.each do |param, _value|
            param_exists = URIConstants::PARAMETERS_NAMES.key?(param)
            raise 'Invalid Paramenters' unless param_exists
          end

          uri = URI(URIConstants::BRASILFONE_BASE_URI)
          uri.query = uri_parameters
          uri
        end

        private

        def uri_parameters
          parameters = {}
          parameters.merge!(service_parameter)
          parameters.merge!(credential_parameters)
          parameters.merge!(other_parameters)
          URI.encode_www_form(parameters)
        end

        def service_parameter
          { service: URIConstants::SERVICES_NAMES[@service] }
        end

        def credential_parameters
          username = BrasilfoneAPI.config.username
          password = BrasilfoneAPI.config.password
          { username: username, password: password }
        end

        def other_parameters
          other_params = {}
          @parameters.each do |param, value|
            param_name = URIConstants::PARAMETERS_NAMES[param]
            other_params[param_name] = value
          end
          other_params
        end
      end
    end
  end
end

require 'brasilfone_api'
require 'uri'
require 'brasilfone_api/http_api_handler/service_uri'

RSpec.describe BrasilfoneAPI::HttpAPIHandler::ServiceURI do 
  before(:all) do
    BrasilfoneAPI.configure do |config|
      config.username = 'frango'
      config.password = 'combatatas'
    end

    @text = URI.escape('Test message to be sent')
    @destination = '202-456-1414'
  end

  describe '.uri_for_service' do
    it 'returns correct uri' do
      uri = BrasilfoneAPI::HttpAPIHandler::ServiceURI.uri_for_service(
        :SEND_SMS,
        text: @text,
        destination: @destination
      )
      expect(uri).to eql "http://api.brasilfone.com.br/?&service=SendSMS&username=frango&password=combatatas&text=Test%20message%20to%20be%20sent&to=202-456-1414"
    end
  end
end

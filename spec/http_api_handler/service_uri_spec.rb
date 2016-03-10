require 'brasilfone_api'
require 'uri'
require 'brasilfone_api/http_api_handler/service_uri'
require 'webmock/rspec'

RSpec.describe BrasilfoneAPI::HttpAPIHandler::ServiceURI do 
  before(:all) do
    BrasilfoneAPI.configure do |config|
      config.username = 'frango'
      config.password = 'combatatas'
    end

    xml = '<note>
           <to>Earth</to>
           <from>Phobos</from>
           <heading>Strange noises</heading>
           <body>Staff personnel are complaining about strange noises</body>
           </note>'

    stub_request(:any, /.*brasilfone.*/)
      .to_return(body: xml, status: 200,
                 headers: { 'Content-Length' => 3 })
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
      expect(uri.to_s).to eql 'http://api.brasilfone.com.br/?service=SendSMS&username=frango&password=combatatas&text=Test%2520message%2520to%2520be%2520sent&to=202-456-1414'
    end
  end
end

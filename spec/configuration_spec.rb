require 'brasilfone_api/configuration'
require 'brasilfone_api'

RSpec.describe BrasilfoneAPI::Configuration do 
  before do
    BrasilfoneAPI::Configuration.reset
  end

  describe 'get credentials' do
    context 'when credentials are set' do
      before do
        @username = 'kuririn'
        @password = 'somorre'
        BrasilfoneAPI.configure do |config|
          config.username = @username
          config.password = @password
        end
      end
      it 'returns credentials' do
        expect(BrasilfoneAPI.config.username).to eql @username
        expect(BrasilfoneAPI.config.password).to eql @password
      end
    end

    context 'when credentials are not set' do
      it 'returns nil' do
        expect(BrasilfoneAPI.config.username).to be nil
        expect(BrasilfoneAPI.config.password).to be nil
      end
    end
  end
end

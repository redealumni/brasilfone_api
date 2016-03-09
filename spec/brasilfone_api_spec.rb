require 'spec_helper'
require 'brasilfone_api'
require 'webmock/rspec'

RSpec.describe BrasilfoneAPI do
  before do
    BrasilfoneAPI.configure do |config|
      config.username = 'martianbuddy'
      config.password = '0508'
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
  end

  it 'sends sms' do
    response = BrasilfoneAPI.send_sms('202-456-1111', 'Hello Mr. President')
    expect(response.class).to eql Hash
  end

  it 'gets sms status' do
    response = BrasilfoneAPI.sms_status('sms id')
    expect(response.class).to eql Hash
  end

  it 'gets balance' do
    response = BrasilfoneAPI.balance
    expect(response.class).to eql Hash
  end

  it 'finds sms status by range' do
    start_date = '2016-01-01 00:00:00'
    end_date = '2016-03-03 00:00:00'
    response = BrasilfoneAPI.sms_status_by_date_range(start_date, end_date)
    expect(response.class).to eql Hash
  end

  it 'finds replies for sms' do
    response = BrasilfoneAPI.reply_status_for_sms('sms_id')
    expect(response.class).to eql Hash
  end

  describe '.parse_phone_number' do
    it 'returns a phone number in the correct format' do
      expect(BrasilfoneAPI.send(:parse_phone_number, '0 0(011) 3453-3124!num'))
        .to eql('1134533124')
    end
  end
end

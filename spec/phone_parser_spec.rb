require 'spec_helper'
require 'brasilfone_api/phone_parser'

RSpec.describe BrasilfoneAPI::PhoneParser do
  describe '.parse_phone_number' do
    it 'returns a phone number in the correct format' do
      dirty_phone = '0 0(011) 3453-3124!num'
      clean_phone = '1134533124'
      expect(BrasilfoneAPI::PhoneParser.parse_phone_number(dirty_phone))
        .to eql(clean_phone)
    end
  end
end

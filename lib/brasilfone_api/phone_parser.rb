module BrasilfoneAPI
  class PhoneParser
    def self.parse_phone_number(phone_number)
      # Remove non Digits
      phone_number.gsub!(/\D/, '')
      # Remove leading zeros
      phone_number.gsub!(/^0+/, '')
    end
  end
end

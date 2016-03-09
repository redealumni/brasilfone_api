require 'brasilfone_api/version'
require 'brasilfone_api/configuration'
require 'brasilfone_api/http_api_handler'

module BrasilfoneAPI
  class << self
    def configure(&block)
      BrasilfoneAPI::Configuration.configure(&block)
    end

    def config
      BrasilfoneAPI::Configuration.config
    end

    def send_sms(destination, text)
      HttpAPIHandler.send_request_for_service(
        :SEND_SMS,
        destination: parse_phone_number(destination),
        text: text
      )
    end

    def sms_status(sms_id)
      HttpAPIHandler.send_request_for_service(
        :GET_SMS_STATUS,
        id: sms_id
      )
    end

    def balance
      HttpAPIHandler.send_request_for_service(:GET_BALANCE)
    end

    def sms_status_by_date_range(start_date, end_date)
      HttpAPIHandler.send_request_for_service(
        :GET_STATUS_BY_DATE,
        start_date: start_date,
        end_date: end_date
      )
    end

    def reply_status_for_sms(sms_id)
      HttpAPIHandler.send_request_for_service(
        :GET_SMS_STATUS,
        id: sms_id
      )
    end

    private

    def parse_phone_number(phone_number)
      # Remove non Digits
      phone_number.gsub!(/\D/, '')
      # Remove leading zeros
      phone_number.gsub!(/^0+/, '')
    end
  end
end

module BrasilfoneAPI
  module HttpAPIHandler
    module URIConstants
      BRASILFONE_BASE_URI = 'http://api.brasilfone.com.br/'.freeze

      SERVICES_NAMES = {
        SEND_SMS: 'SendSMS'.freeze,
        GET_SMS_STATUS: 'GetStatus'.freeze,
        GET_BALANCE: 'GetBalance'.freeze,
        GET_STATUS_BY_DATE: 'GetStatusByDate'.freeze,
        GET_REPLY_STATUS: 'GetStatusResposta'.freeze
      }.freeze

      PARAMETERS_NAMES = {
        destination: 'to'.freeze,
        id: 'id'.freeze,
        start_date: 'date_start'.freeze,
        end_date: 'date_end'.freeze,
        text: 'text'.freeze
      }.freeze
    end
  end
end

require 'net/http'
require 'json'

# namespace
module Qiksms
  # class
  class Client
    attr_accessor :api_key, :api_secret, :recipient, :message

    MSG_PARAMS = {}
    HOST = 'https://app.qiksms.com/api/send'.freeze

    def initialize(options={})
      @api_key    = Qiksms.configuration.api_key
      @api_secret = Qiksms.configuration.api_secret
      @sender_id  = options[:sender_id]
      @char_type  = options[:char_type]
      @recipient  = options[:recipient]
      @message    = options[:message]
    end

    def sender_id
      @sender_id ||= Qiksms.configuration.sender_id
    end

    def char_type
      @char_type ||= Qiksms.configuration.char_type
    end

    def send
      uri = URI(HOST)

      request = Net::HTTP.post_form(uri, message_params)
      response = JSON.parse(request.body, symbolize_names: true)

      return raise Errors::Authentication, response[:error] if response.key?(:error)

      case response[:code]
      when 200
        response
      when 422
        raise Errors::BadRequest, response[:message]
      end
    end

    def self.send(options={})
      obj = new(options)
      obj.send
    end

    private

    def message_params
      MSG_PARAMS['api_secret'] = api_secret
      MSG_PARAMS['api_key']    = api_key
      MSG_PARAMS['recipient']  = recipient
      MSG_PARAMS['message']    = message
      MSG_PARAMS['char_type']  = char_type
      MSG_PARAMS['from']       = sender_id
      MSG_PARAMS
    end
  end
end

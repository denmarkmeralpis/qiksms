# namespacing
module Qiksms
  # class cofiguration
  class Configuration
    attr_writer :api_key, :api_secret, :char_type, :sender_id

    def initialize
      @api_key = nil
      @api_secret = nil
      @char_type = nil
      @sender_id = nil
    end

    def api_key
      raise Errors::Configuration, 'Qiksms api_key is missing! See documentation for configuration settings.' unless @api_key
      @api_key
    end

    def api_secret
      raise Errors::Configuration, 'Qiksms api_secret is missing! See documentation for configuration settings.' unless @api_secret
      @api_secret
    end

    def char_type
      raise Errors::Configuration, 'Qiksms char_type is missing! See documentation for configuration settings.' unless @char_type
      @char_type
    end

    def sender_id
      raise Errors::Configuration, 'Qiksms sender_id is missing! See documentation for configuration settings.' unless @sender_id
      @sender_id
    end
  end
end

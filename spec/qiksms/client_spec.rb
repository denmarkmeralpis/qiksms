require_relative '../spec_helper'
require 'webmock/rspec'
require 'dotenv'

Dotenv.load

RSpec.describe Qiksms::Client do
   let(:address) { '09177710296' }
   let(:message) { 'This is a sample SMS message! Hola!' }
   let(:client) { Qiksms::Client.new(address: address, message: message) }

   before do
		Qiksms.configure do |config|
			config.api_key = ENV['QIKSMS_API_KEY']
			config.api_secret = ENV['QIKSMS_API_SECRET']
		end
	end  
end
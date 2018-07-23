require_relative '../spec_helper'
require 'webmock/rspec'
require 'dotenv'

Dotenv.load

RSpec.describe Qiksms::Client do
   let(:recipient) { '9177710296' }
   let(:message) { 'Test message from Qiksms' }
	let(:client) { Qiksms::Client.new(recipient: recipient, message: message) }
	let(:host) { 'https://app.qiksms.com/api/send' }

   before do
		Qiksms.configure do |config|
			config.api_key = ENV['QIKSMS_API_KEY']
			config.api_secret = ENV['QIKSMS_API_SECRET']
			config.char_type = ENV['QIKSMS_CHAR_TYPE']
			config.sender_id = ENV['QIKSMS_SENDER_ID']
		end
	end  

	context '#send' do
		it 'returns success response' do
			stub_request(:post, host).to_return(body: response_body('success.json'), status: 200, headers: {})
			
			expect(client.send).to have_key(:code)
			expect(client.send).to have_key(:message)
			expect(client.send).to have_key(:status)
		
			expect(client.send[:code]).to eq(200)
			expect(client.send[:message]).not_to be_empty
			expect(client.send[:status]).to eq('success')
		end

		it 'directs sending without initializing' do
			stub_request(:post, host).to_return(body: response_body('success.json'), status: 200, headers: {})

			expect(client.send).to have_key(:code)
			expect(client.send).to have_key(:message)
			expect(client.send).to have_key(:status)
			
			expect(client.send[:code]).to eq(200)
			expect(client.send[:message]).not_to be_empty
			expect(client.send[:status]).to eq('success')
		end

		it 'overrides default config' do
			stub_request(:post, host).to_raise(Qiksms::Errors::BadRequest)
			
			expect { Qiksms::Client.send(recipient: recipient, message: message, char_type: '1', sender_id: 'custom_from') }.to raise_error(Qiksms::Errors::BadRequest)
		end

		it 'returns authorization error response' do
			Qiksms.configuration.api_key = 'invalid-api-key'
			Qiksms.configuration.api_secret = 'invali-api-secret'
			
			stub_request(:post, host).to_raise(Qiksms::Errors::Authentication)

			expect { Qiksms::Client.send(recipient: recipient, message: message, char_type: '1', sender_id: 'custom_from') }.to raise_error(Qiksms::Errors::Authentication)
		end

		it 'returns bad request error response' do			
			stub_request(:post, host).to_raise(Qiksms::Errors::BadRequest)

			# empty message
			expect { Qiksms::Client.send(recipient: recipient, message: nil) }.to raise_error(Qiksms::Errors::BadRequest)

			# invalid char_type
			expect { Qiksms::Client.send(recipient: recipient, message: message, char_type: '1') }.to raise_error(Qiksms::Errors::BadRequest)
		end
	end

	def response_body(file_name)
		File.read(File.expand_path('../../support/fixtures/' + file_name, __FILE__))
	end

end
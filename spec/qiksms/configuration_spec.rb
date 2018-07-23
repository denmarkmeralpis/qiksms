require_relative '../spec_helper'
require 'dotenv'

Dotenv.load

RSpec.describe Qiksms::Configuration do   
	before do
		Qiksms.configure do |config|
			config.api_key = ENV['QIKSMS_API_KEY']
			config.api_secret = ENV['QIKSMS_API_SECRET']
			config.sender_id = ENV['QIKSMS_SENDER_ID']
			config.char_type = ENV['QIKSMS_CHAR_TYPE']
		end
	end

	context 'with configuration block' do
		it 'returns the correct qiksms api key' do
			expect(Qiksms.configuration.api_key).to eq(ENV['QIKSMS_API_KEY'])
		end

		it 'returns the correct qiksms api secret' do
			expect(Qiksms.configuration.api_secret).to eq(ENV['QIKSMS_API_SECRET'])
		end

		it 'returns the correct qiksms sender id' do
			expect(Qiksms.configuration.sender_id).to eq(ENV['QIKSMS_SENDER_ID'])
		end

		it 'returns the correct qiksms char type' do
			expect(Qiksms.configuration.char_type).to eq(ENV['QIKSMS_CHAR_TYPE'])
		end
	end

	context 'without configuration block' do
		before do
			Qiksms.reset
      end
      
		it 'raises a configuration error for api_key' do
			expect { Qiksms.configuration.api_key }.to raise_error(Qiksms::Errors::Configuration)
		end

		it 'raises a configuration error for api_secret' do
			expect { Qiksms.configuration.api_secret }.to raise_error(Qiksms::Errors::Configuration)
		end

		it 'raises a configuration error for sender_id' do
			expect { Qiksms.configuration.sender_id }.to raise_error(Qiksms::Errors::Configuration)
		end

		it 'raises a configuration error for char_type' do
			expect { Qiksms.configuration.char_type }.to raise_error(Qiksms::Errors::Configuration)
		end
	end

	context '#reset' do
		it 'resets configured values' do
			expect(Qiksms.configuration.api_key).to eq(ENV['QIKSMS_API_KEY'])
			expect(Qiksms.configuration.api_secret).to eq(ENV['QIKSMS_API_SECRET'])
			expect(Qiksms.configuration.char_type).to eq(ENV['QIKSMS_CHAR_TYPE'])
			expect(Qiksms.configuration.sender_id).to eq(ENV['QIKSMS_SENDER_ID'])

			Qiksms.reset
			expect { Qiksms.configuration.api_key }.to raise_error(Qiksms::Errors::Configuration)
			expect { Qiksms.configuration.api_secret }.to raise_error(Qiksms::Errors::Configuration)
			expect { Qiksms.configuration.char_type }.to raise_error(Qiksms::Errors::Configuration)
			expect { Qiksms.configuration.sender_id }.to raise_error(Qiksms::Errors::Configuration)
		end
	end
end
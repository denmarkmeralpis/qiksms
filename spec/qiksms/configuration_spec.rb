require_relative '../spec_helper'
require 'dotenv'

Dotenv.load

RSpec.describe Qiksms::Configuration do   
	before do
		Qiksms.configure do |config|
			config.api_key = ENV['QIKSMS_API_KEY']
			config.api_secret = ENV['QIKSMS_API_SECRET']
		end
	end

	context 'with configuration block' do
		it 'returns the correct qiksms api key' do
			expect(Qiksms.configuration.api_key).to eq(ENV['QIKSMS_API_KEY'])
		end

		it 'returns the correct qiksms api secret' do
			expect(Qiksms.configuration.api_secret).to eq(ENV['QIKSMS_API_SECRET'])
		end
	end

	context 'without configuration block' do
		before do
			Qiksms.reset
      end
      
		it 'raises a configuration error for api_key' do
			expect { Qiksms.configuration.api_key }.to raise_error(Qiksms::Errors::Configuration)
		end

		it 'raises a configuration error for secret' do
			expect { Qiksms.configuration.api_secret }.to raise_error(Qiksms::Errors::Configuration)
		end
	end

	context '#reset' do
		it 'resets configured values' do
			expect(Qiksms.configuration.api_key).to eq(ENV['QIKSMS_API_KEY'])
			expect(Qiksms.configuration.api_secret).to eq(ENV['QIKSMS_API_SECRET'])

			Qiksms.reset
			expect { Qiksms.configuration.api_key }.to raise_error(Qiksms::Errors::Configuration)
			expect { Qiksms.configuration.api_secret }.to raise_error(Qiksms::Errors::Configuration)
		end
	end
end
require 'bundler/setup'
require 'qiksms'
require 'byebug'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.expose_dsl_globally = true
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Qiksms.configure do |qiksms_config|
      qiksms_config.api_secret = ENV['QIKSMS_API_SECRET']
      qiksms_config.api_key = ENV['QIKSMS_API_KEY']
      qiksms_config.char_type = ENV['QIKSMS_CHAR_TYPE']
      qiksms_config.sender_id = ENV['QIKSMS_SENDER_ID']
    end
  end
end

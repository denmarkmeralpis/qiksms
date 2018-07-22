require 'bundler/setup'
require 'qiksms'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Qiksms.configure do |config|
      config.api_secret = ENV['QIKSMS_API_SECRET']
      config.api_key = ENV['QIKSMS_API_KEY']
    end
  end
end

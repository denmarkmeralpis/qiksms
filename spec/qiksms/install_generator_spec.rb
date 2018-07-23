require 'generator_spec'
require_relative '../spec_helper'

RSpec.describe Qiksms::Generators::InstallGenerator, type: :generator do
  destination File.expand_path('../tmp', __dir__)
  arguments %w[install]

  before(:all) do
    prepare_destination
    run_generator
  end

  after(:all) do
    system 'rm -rf spec/tmp'
  end

  context 'creates a qiksms.rb initializer' do
    it { assert_file 'config/initializers/qiksms.rb' }
  end
end

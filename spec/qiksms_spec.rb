require 'spec_helper'

RSpec.describe Qiksms do
  context 'gem version' do
    it "has a version number" do
      expect(Qiksms::VERSION).not_to be nil
    end
  end
end

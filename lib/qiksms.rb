require 'qiksms/version'
require 'qiksms/configuration'
require 'qiksms/client'
require 'qiksms/errors/configuration'
require 'generators/qiksms/install_generator'

# Qiksms configuration block
module Qiksms
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

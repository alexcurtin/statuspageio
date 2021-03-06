require 'statuspageio/client'
require 'statuspageio/configuration'

module Statuspageio
  extend Configuration
  class << self
    # Alias for Statuspageio::Client.new
    #
    # @return [Statuspageio::Client]
    def new(options = {})
      Statuspageio::Client.new(options)
    end

    # Delegate to Gems::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method_name, include_private = false)
      new.respond_to?(method_name, include_private) || super(method_name, include_private)
    end

    def respond_to_missing?(method_name, include_private = false)
      new.respond_to?(method_name, include_private) || super(method_name, include_private)
    end
  end
end

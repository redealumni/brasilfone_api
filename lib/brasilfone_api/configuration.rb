module BrasilfoneAPI
  class Configuration
    attr_accessor :username, :password

    def self.configure
      @config ||= Configuration.new
      yield(@config) if block_given?
      @config
    end

    def self.config
      @config || configure
    end

    def self.reset
      @config || configure
      config.username = nil
      config.password = nil
    end
  end
end

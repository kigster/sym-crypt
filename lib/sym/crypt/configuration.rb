require 'singleton'
require 'sym/configurable'
require 'sym/crypt/configuration'
require 'ostruct'
module Sym
  module Crypt
    # This class encapsulates application configuration, and exports
    # a familiar method +#configure+ for defining configuration in a
    # block.
    #
    # It's values are requested by the library upon encryption or
    # decryption, or any other operation.
    #
    # == Example
    #
    # The following is an actual initialization from the code of this
    # library. You may override any of the value defined below in your
    # code, but _before_ you _use_ library's encryption methods.
    #
    #       Sym::Crypt::Configuration.configure do |config|
    #         config.password_cipher          = 'AES-128-CBC'
    #         config.data_cipher              = 'AES-256-CBC'
    #         config.private_key_cipher       = config.data_cipher
    #         config.compression_enabled      = true
    #         config.compression_level        = Zlib::BEST_COMPRESSION
    #       end

    class Configuration
      attr_accessor :password_cipher,
                    :data_cipher,
                    :private_key_cipher,
                    :compression_enabled,
                    :compression_level

      def initialize
        self.password_cipher     = 'AES-128-CBC'
        self.data_cipher         = 'AES-256-CBC'
        self.private_key_cipher  = data_cipher
        self.compression_enabled = true
        self.compression_level   = Zlib::BEST_COMPRESSION
      end

      include Sym::Configurable

    end
  end
end

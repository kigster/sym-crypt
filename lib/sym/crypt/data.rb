require 'base64'
require 'zlib'

require 'sym/crypt/data/encoder'
require 'sym/crypt/data/decoder'
require 'sym/crypt/data/wrapper_struct'

module Sym
  module Crypt
    # This module is responsible for taking arbitrary data of any format, and safely compressing
    # the result of `Marshal.dump(data)` using Zlib, and then doing `#urlsafe_encode64` encoding
    # to convert it to a string,
    module Data
      def encode(data, compress = true)
        Encoder.new(data, compress).data_encoded
      end

      def decode(data_encoded, compress = nil)
        Decoder.new(data_encoded, compress).data
      end
    end
  end
end


require 'base64'
require 'sym/crypt/cipher_handler'

module Sym
  module Crypt
    module Extensions
      module ClassMethods
        def create_private_key
          key = Sym::Crypt::NEW_CIPHER_PROC.call(Sym::Crypt::Configuration.property(:private_key_cipher)).random_key
          ::Base64.urlsafe_encode64(key)
        end
      end
    end
  end
end

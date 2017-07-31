require 'base64'
require 'sym/crypt'

module Sym
  module Crypt

    # {Sym::Crypt::CipherHandler} contains cipher-related utilities necessary to create
    # ciphers, and seed them with the salt or iV vector. It also defines the
    # internal structure {Sym::Crypt::CipherHandler::CipherStruct} which is a key
    # struct used in constructing cipher and saving it with the data packet.
    module CipherHandler

      CipherStruct = Struct.new(:cipher,
                                :iv,
                                :salt)

      def create_cipher(direction:,
                        cipher_name:,
                        iv: nil,
                        salt: nil)

        cipher = NEW_CIPHER_PROC.call(cipher_name)
        cipher.send(direction)
        iv        ||= cipher.random_iv
        cipher.iv = iv
        CipherStruct.new(cipher, iv, salt)
      end

      def update_cipher(cipher, value)
        data = cipher.update(value)
        data << cipher.final
        data
      end
    end
  end
end


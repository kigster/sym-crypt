module Sym
  module Crypt
    # All public exceptions of this library are here.
    module Errors
      # Exceptions superclass for this library.
      class Sym::Crypt::Errors::Error < StandardError;
      end

      # No secret has been provided for encryption or decryption
      class InsufficientOptionsError < Sym::Crypt::Errors::Error;
      end

      class PasswordError < Sym::Crypt::Errors::Error;
      end
      class NoPasswordProvided < Sym::Crypt::Errors::PasswordError;
      end
      class PasswordsDontMatch < Sym::Crypt::Errors::PasswordError;
      end
      class PasswordTooShort < Sym::Crypt::Errors::PasswordError;
      end
      class CantReadPasswordNoTTY < Sym::Crypt::Errors::PasswordError;
      end

      class EditorExitedAbnormally < Sym::Crypt::Errors::Error;
      end

      class FileNotFound < Sym::Crypt::Errors::Error;
      end

      class DataEncodingVersionMismatch< Sym::Crypt::Errors::Error;
      end

      class KeyError < Sym::Crypt::Errors::Error;
      end
      class InvalidEncodingPrivateKey < Sym::Crypt::Errors::KeyError;
      end
      class InvalidPasswordProvidedForThePrivateKey < Sym::Crypt::Errors::KeyError;
      end
      class NoPrivateKeyFound < Sym::Crypt::Errors::KeyError;
      end

      class NoDataProvided < Sym::Crypt::Errors::Error;
      end

      class KeyChainCommandError < Sym::Crypt::Errors::Error;
      end

      # Method was called on an abstract class. Override such methods in
      # subclasses, and use subclasses for instantiation of objects.
      class AbstractMethodCalled < ArgumentError
        def initialize(method, message = nil)
          super("Abstract method call, on #{method}" + (message || ''))
        end
      end
    end
  end
end

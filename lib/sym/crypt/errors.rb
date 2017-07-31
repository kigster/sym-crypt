module Sym
  module Crypt
    # All public exceptions of this library are here.
    module Errors
      class Error < StandardError; end

      class NoPasswordProvided < Sym::Crypt::Errors::Error; end

      class NoPrivateKeyFound < Sym::Crypt::Errors::Error; end

      class NoDataProvided < Sym::Crypt::Errors::Error; end
    end
  end
end

module Sym
  module Crypt
  VERSION     = '1.0.0'
  DESCRIPTION = <<-eof
sym-crypt is a core encryption module for the symmetric encryption app 
(and a corresponding gem) "sym", and contains the main base serialization, 
encryption, encoding, compression routines.

sym-crypt uses a symmetric 256-bit key with the AES-256-CBC cipher, which is the 
same cipher as the one used by the US Government. For encyption with a 
password sym-crypt uses AES-128-CBC cipher. 

The resulting data is zlib-compressed and base64-encoded. The keys are also 
base64 encoded for easy copying/pasting/etc.
  eof
  end
end

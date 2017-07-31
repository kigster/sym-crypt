# SymCrypt

## Simple Symmetric Encryption Using OpenSSL 

[![Gem Version](https://badge.fury.io/rb/sym-crypt.svg)](https://badge.fury.io/rb/sym-crypt)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/sym-crypt?type=total)](https://rubygems.org/gems/sym-crypt)

[![Build Status](https://travis-ci.org/kigster/sym-crypt.svg?branch=master)](https://travis-ci.org/kigster/sym-crypt)
[![Code Climate](https://codeclimate.com/github/kigster/sym-crypt/badges/gpa.svg)](https://codeclimate.com/github/kigster/sym-crypt)
[![Test Coverage](https://codeclimate.com/github/kigster/sym-crypt/badges/coverage.svg)](https://codeclimate.com/github/kigster/sym-crypt/coverage)
[![Issue Count](https://codeclimate.com/github/kigster/sym-crypt/badges/issue_count.svg)](https://codeclimate.com/github/kigster/sym-crypt)

[![Gitter](https://img.shields.io/gitter/room/gitterHQ/gitter.svg)](https://gitter.im/kigster/sym)

---

### Summary

The `sym-crypt` core library offers simple wrappers around OpenSSL with the following features:

 * Symmetric data encryption with:
   1. A generated or provided 256-bit key:
       * the Cipher `AES-256-cBC` used by the US Government
       * The generated key is a *base64-encoded* string of about 45 characters long. The *decoded* key is always 32 characters (or 256 bytes) long.
   2. A user-provided password:
       * the Cipher `AES-256-cBC` used by the US Government
       * 256-bit private key, that can be automatically generated
       * The generated key is a *base64-encoded* string of about 45    
 * Data handling:
   * Automatic compression of the data upon encryption
   * Automatic base64 encryption to make all encrypted strings fit onto a single line.
   * This makes the format suitable for YAML or JSON configuration files, where only the values are encrypted.
 

### Usage

This library is a "wrapper" that allows you to take advantage of the
symmetric encryption functionality provided by the {OpenSSL} gem (and the
underlying C library). In order to use the library in your ruby classes, you
should _include_ the module `Sym::Crypt`.

#### Encrypting and Decrypting Data

The including class is decorated with four instance methods from the
module `Sym::Crypt::Extensions::InstanceMethods` —  `[:encr, :decr, :encr_password, :decr_password]`, and three class methods from `Sym::Crypt::Extensions::ClassMethods` —  `[:create_private_key, :private_key, :private_key=]`.

 * The two main instance methods are `#encr` and `#decr`, which perform two-way symmetric encryption and decryption of any Ruby string.

 * Two additional instance methods `#encr_password` and +`#decr_password` offer 
encryption with user-generated passwords, by using the password to construct a 128-bit long private key, and then uses that in the encryption of the data. When it is more important to have an easy-to-remember password, this may be a better method.

#### Generating an Enryption Key

You can create a new key within each class that includes `Sym::Crypt` by calling the `#create_private_key` class method, which returns a new key every time it's called.
 
 Classes that include `Sym::Crypt` are also decorated with a class instance variable `@private_key` and corresponding accessors `#private_key` and `#private_key=`. The writer assigns the key passed via the argument, while the reader returns a previously assigned key, or creates a new one, and caches it at a class level.

 
#### Symmetric Encryption with a 256-bit Private Key

In the example below, we read a previously generated key from the environment variable. The key must be stored away from the data for obvious reasons.

```ruby
require 'sym/crypt'

class TopSecret
  include Sym::Crypt
  # read the key from environmant variable and assign to this class.
  private_key ENV['PRIVATE_KEY']

  def sensitive_value=(value)
    @sensitive_value = encr(value, self.class.private_key)
  end

  def sensitive_value
    decr(@sensitive_value, self.class.private_key)
  end
end
```

#### Symmetric Encryption with the Password

In this example we encrypt sensitive value with a simple provided password.  Password must not be nil or blank.

```ruby
require 'sym/crypt'

class SensitiveStuff < Struct.new(:password)
  include Sym::Crypt  
  
  def sensitive_value=(value)
    @sensitive_value = encr_password(value, password)
  end

  def sensitive_value
    decr(@sensitive_value, password)
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

#### Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/kigster/sym-crypt](https://github.com/kigster/sym-crypt)

### License

**sym** and **sym-crypt** library is &copy; 2016-2017 Konstantin Gredeskoul.

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). The library is designed to be a layer on top of [`OpenSSL`](https://www.openssl.org/), distributed under the [Apache Style license](https://www.openssl.org/source/license.txt).

### Acknowledgements

 * The blog post [(Symmetric) Encryption With Ruby (and Rails)](http://stuff-things.net/2015/02/12/symmetric-encryption-with-ruby-and-rails/) provided the inspiration for this gem. 
 * We'd like to thank [Spike Ilacqua](http://stuff-things.net/spike/), the author of the [strongbox](https://github.com/spikex/strongbox) gem, for providing very easy-to-read code examples of symmetric encryption.

#### Contributors:

Contributions of any kind are very much welcome from anyone. 

Any pull requests will be reviewed promptly. 

Please submit feature requests, bugs, or donations :) 

 * [Konstantin Gredeskoul](http:/kig.re) (primary developer)
 * [Barry Anderson](https://twitter.com/z3ndrag0n) (sanity checking, review)

 


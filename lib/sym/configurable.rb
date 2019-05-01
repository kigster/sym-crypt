require 'singleton'
module Sym
  module Configurable
    def self.included(base)
      base.instance_eval do
        include Singleton

        class << self
          def config
            instance
          end

          def configure
            yield config if block_given?
            config
          end

          def property(prop_name, prop_value = nil)
            config.send("#{prop_name}=", prop_value) if prop_name && prop_value
            config.send(prop_name)
          end

          alias_method :[], :property
        end
      end
    end
  end
end

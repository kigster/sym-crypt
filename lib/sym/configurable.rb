require 'singleton'
module Sym
  module Configurable
    def self.included(base)
      base.instance_eval do
        include Singleton
        class << self
          include Sym::Configurable::ClassMethods
        end
      end
    end

    module ClassMethods
      def config
        instance
      end

      def configure
        yield config if block_given?
        config
      end

      def defaults!
        [ self, *self.ancestors ].each do |klazz|
          next unless klazz.is_a?(Class)
          if klazz.const_defined?(:DEFAULTS)
            default_proc = self.const_get(:DEFAULTS)
            if default_proc.respond_to?(:call)
              configure(&default_proc)
            end
          end
        end
      end

      def property(prop_name)
        config.send(prop_name)
      end

      alias_method :prop, :property
      alias_method :[], :property
    end
  end
end

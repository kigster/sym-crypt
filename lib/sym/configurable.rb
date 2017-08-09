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

      def property(prop_name)
        config.send(prop_name)
      end

      alias_method :prop, :property
      alias_method :[], :property
    end
  end
end

module AwesomePrint
  module Carrierwave
    def self.included(base)
      base.send :alias_method, :cast_without_carrierwave, :cast
      base.send :alias_method, :cast, :cast_with_carrierwave
    end
    
    def cast_with_carrierwave(object, type)
      if defined?(::CarrierWave) && object.is_a?(::CarrierWave::Uploader::Base)
        :carrierwave_uploader_instance
      else
        cast_without_carrierwave(object, type)
      end
    end
    
    private
    def awesome_carrierwave_uploader_instance(o)
      if defined? ::ActiveSupport::OrderedHash
        if @options[:raw]
          awesome_object(o)
        else
          storage_symbol = o.class.storage_engines.key(o._storage.name)
          "#{o.class.name} with #{storage_symbol.inspect} " << awesome_hash(o.serializable_hash)
        end
      else
        object.inspect
      end
    end
  end
end

AwesomePrint::Formatter.include(AwesomePrint::Carrierwave) if defined?(CarrierWave) && AwesomePrint.rails_console?
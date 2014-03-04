require "awesome_print_carrier_wave_uploader/version"
require "active_support/concern"
require "active_support/core_ext/module/aliasing"

module AwesomePrintCarrierWaveUploader
  extend ActiveSupport::Concern
  
  included do
    alias_method_chain :cast, :carrierwave_uploader
  end
  
  def cast_with_carrierwave_uploader(object, type)
    if defined?(::CarrierWave) && object.is_a?(::CarrierWave::Uploader::Base)
      :carrierwave_uploader_instance
    else
      cast_without_carrierwave_uploader(object, type)
    end
  end
  
  private
  def awesome_carrierwave_uploader_instance(object)
    return object.inspect if !defined?(::ActiveSupport::OrderedHash)
    return awesome_object(object) if @options[:raw]
    
    data = {
      url:      object.to_s,
      versions: object.versions.keys
    }
    "#{object.class.name} stored in #{object._storage.class_name}" << awesome_hash(data)
  end
end

if defined? AwesomePrint
  AwesomePrint::Formatter.send :include, AwesomePrintCarrierWaveUploader
end
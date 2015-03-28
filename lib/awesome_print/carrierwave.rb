module AwesomePrint
  module CarrierWave
    def self.included(base)
      base.send :alias_method, :cast_without_carrierwave, :cast
      base.send :alias_method, :cast, :cast_with_carrierwave
    end

    # Add CarrierWave class names to the dispatcher pipeline.
    def cast_with_carrierwave(object, type)
      if defined?(::CarrierWave) && object.is_a?(::CarrierWave::Uploader::Base)
        :carrierwave_uploader_instance
      else
        cast_without_carrierwave(object, type)
      end
    end

    private

    # Format CarrierWave::Uploader instance object.
    #
    # NOTE: by default only uploader class name, storage and serialiazed
    # versions are shown. To format CarrierWave::Instance instance as
    # regular object showing its instance variables and accessors use
    # <tt>raw: true</tt> option:
    #
    #   ap record.uploader, raw: true
    def awesome_carrierwave_uploader_instance(uploader)
      if @options[:raw]
        awesome_object(uploader)
      else
        "#{uploader.class.name} with #{uploader.class.storage_engines.key(uploader._storage.name)} " \
          << awesome_hash(uploader.serializable_hash)
      end
    end
  end
end

AwesomePrint::Formatter.include(AwesomePrint::CarrierWave)
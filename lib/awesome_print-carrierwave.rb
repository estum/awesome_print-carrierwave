if defined?(::AwesomePrint::Inspector)
  require "awesome_print/carrierwave" if defined?(CarrierWave) || AwesomePrint.rails_console?
end
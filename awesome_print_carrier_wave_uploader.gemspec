# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'awesome_print_carrier_wave_uploader/version'

Gem::Specification.new do |spec|
  spec.name          = "awesome_print_carrier_wave_uploader"
  spec.version       = AwesomePrintCarrierWaveUploader::VERSION
  spec.authors       = ["Tõnis Simo"]
  spec.email         = ["anton.estum@gmail.com"]
  spec.description   = %q{Formats CarrierWave::Uploader instance objects with AwesomePrint}
  spec.summary       = %q{AwesomePrint formatter for CarrierWave::Uploader instance objects}
  spec.homepage      = ""
  spec.license       = "MIT"
  
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_dependency "activesupport"
end
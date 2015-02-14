# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "awesome_print-carrierwave"
  spec.version       = "0.0.2"
  spec.authors       = ["Tõnis Simo"]
  spec.email         = ["anton.estum@gmail.com"]
  spec.description   = %q{Replace ugly inspection of mounted CarrierWave uploaders in Awesome Print}
  spec.summary       = %q{AwesomePrint formatter for CarrierWave::Uploader instance objects}
  spec.homepage      = "https://github.com/estum/awesome_print-carrierwave"
  spec.license       = "MIT"
  
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

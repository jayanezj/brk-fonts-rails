# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brk-fonts-rails/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "brk-fonts-rails"
  spec.version       = BrkFonts::Rails::VERSION
  spec.authors       = ["José Antonio Yáñez Jiménez"]
  spec.email         = ["jose@jimenezfrontent.es"]
  spec.summary       = %q{Add brk-fonts icons to your Ruby On Rails project}
  spec.description   = %q{Brk fonts is an icon package formed by vectorial glyphs born to fill in missing programming language icons ​​in the main icon packs (AKA Awesome Font)}
  spec.homepage      = "http://brkfonts.jimenezfrontent.es"
  spec.license       = "GPL"

  spec.files         = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir["test/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 3.2", "< 5.0"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "sass-rails"
end

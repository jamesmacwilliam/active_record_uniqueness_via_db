# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_uniqueness_via_db/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_uniqueness_via_db"
  spec.version       = ActiveRecordUniquenessViaDb::VERSION
  spec.authors       = ["James Mac William"]
  spec.email         = ["jimmy.macwilliam@gmail.com"]

  spec.summary       = %q{Extend ActiveRecord uniqueness validations with via: :db option.}
  spec.homepage      = "https://github.com/jamesmacwilliam/active_record_uniqueness_via_db"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",      "~> 1.10"
  spec.add_development_dependency "rake",         "~> 10.0"
  spec.add_dependency             "activerecord", ">= 4.0.0", "< 5.1"
  spec.add_dependency             "railties",     ">= 4.1.0", "< 5.1"
  spec.add_development_dependency "rspec"
end

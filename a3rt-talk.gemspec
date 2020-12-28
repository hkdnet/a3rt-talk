# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'a3rt/talk/version'

Gem::Specification.new do |spec|
  spec.name          = "a3rt-talk"
  spec.version       = A3rt::Talk::VERSION
  spec.authors       = ["hkdnet"]
  spec.email         = ["hkdnet@users.noreply.github.com"]

  spec.summary       = 'a3rt talk api helper'
  spec.description   = 'a3rt talk api helper'
  spec.homepage      = "https://github.com/hkdnet/a3rt-talk"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

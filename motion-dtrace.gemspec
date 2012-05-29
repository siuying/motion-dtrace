# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-dtrace/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "motion-dtrace"
  s.version     = DTrace::VERSION
  s.authors     = ["Francis Chong"]
  s.email       = ["francis@ignition.hk"]
  s.homepage    = "https://github.com/siuying/motion-dtrace"
  s.summary     = "use DTrace on motion"
  s.description = "use DTrace on motion"

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_dependency 'rake'

end
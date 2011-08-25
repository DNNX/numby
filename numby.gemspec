# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "numby/version"

Gem::Specification.new do |s|
  s.name        = "numby"
  s.version     = Numby::VERSION
  s.authors     = ["Viktar Basharymau"]
  s.email       = ["6alliapumob@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Some number methods (each_divisor, digital_root, etc.)}

  s.rubyforge_project = "numby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-notifu"
  s.add_development_dependency "rb-fchange"
  s.add_development_dependency "win32console"
  s.add_dependency "rake", "~> 0.9"
  # s.add_runtime_dependency "rest-client"
end

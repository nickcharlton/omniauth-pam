# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-pam/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-pam"
  s.version     = OmniAuth::PAM::VERSION
  s.authors     = ["Nick Charlton"]
  s.email       = ["hello@nickcharlton.net"]
  s.homepage    = "https://github.com/nickcharlton/omniauth-pam"
  s.summary     = %q{A PAM strategy for OmniAuth.}
  s.description = %q{A PAM strategy for OmniAuth.}

  s.rubyforge_project = "omniauth-pam"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth", '~> 1.0'
  s.add_runtime_dependency "rpam-ruby"
end

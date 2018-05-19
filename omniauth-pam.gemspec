$:.push File.expand_path("lib", __dir__)

require "omniauth-pam/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-pam"
  s.version     = OmniAuth::PAM::VERSION
  s.authors     = ["Nick Charlton"]
  s.email       = ["nick@nickcharlton.net"]
  s.homepage    = "https://github.com/nickcharlton/omniauth-pam"
  s.license     = "MIT"
  s.summary     = "A PAM strategy for OmniAuth."
  s.description = "An OmniAuth strategy to allow you to authenticate " \
                  "against Pluggable Authentication Modules (PAM)."

  s.files         = `git ls-files`.split($RS)
  s.executables   = s.files.grep(/^exe/) { |f| File.basename(f) }
  s.test_files    = s.files.grep(/^(test|spec|features)/)
  s.require_paths = ["lib"]

  s.add_runtime_dependency "omniauth", "~> 1.5"
  s.add_runtime_dependency 'rpam-ruby19', '~> 1.2.1'
  s.add_runtime_dependency 'etc'

  s.add_development_dependency "pry"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end

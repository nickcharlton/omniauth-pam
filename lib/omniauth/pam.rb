require "omniauth"
require "rpam"
require "etc"

module OmniAuth
  module Strategies
    autoload :PAM, "omniauth/strategies/pam"
  end
end

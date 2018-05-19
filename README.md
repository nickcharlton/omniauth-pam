# omniauth-pam

An [OmniAuth][] strategy to allow you to authentication against
[Pluggable Authentication Modules][pam] (PAM).

## Installation

Add `omniauth-pam` to your Gemfile, or:

```
gem install omniauth-pam
```

## Usage

`libpam0g-dev` is needed to install on Debian and Ubuntu. An example
`Vagrantfile` is provided to test this out.

### Sinatra Example

```ruby
require "omniauth"
require "omniauth-pam"

use Rack::Session::Cookie, secret: "a_random_hash"
use OmniAuth::Strategies::PAM

get "/auth/:provider/callback" do
  puts request.env['omniauth.auth']
end
```

See the [example/][] directory.

## Contributing

1. Fork it ( https://github.com/nickcharlton/omniauth-pam/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Author

Copyright (c) 2018 Nick Charlton. MIT Licensed.

[OmniAuth]: https://github.com/omniauth/omniauth
[pam]: https://en.wikipedia.org/wiki/Pluggable_authentication_module<Paste>
[example/]: /example

# omniauth-pam

An OmniAuth strategy to allow you to authentication against Pluggable Authentication
Modules (PAM).

## Installation

Add `omniauth-pam` to your Gemfile, or:

```
gem install omniauth-pam
```

## Usage

It has been tested under Ruby 1.9 and 2.0 on both Debian Wheezy (7.0) and Ubuntu
Precise (12.04). [Ruby 1.8 can be made to work with small adjustments][oldruby].
Under both Debian and Ubuntu you'll need the `libpam0g-dev` package to compile the
`rpam` dependency.

The included `Vagrantfile` provides a Debian Wheezy environment and the `example/`
directory provides a working Sinatra example.

### Simple Sinatra Example

But, getting it working is as simple as this:

```ruby
require 'omniauth'
require 'omniauth-pam'

use Rack::Session::Cookie
use OmniAuth::Strategies::PAM

get '/auth/:provider/callback' do
    puts request.env['omniauth.auth']
end
```

## Author

Copyright (c) 2013 Nick Charlton and contributors. MIT Licensed.

[oldruby]: http://nickcharlton.net/post/pam-for-omniauth


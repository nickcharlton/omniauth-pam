# OmniAuth PAM

Allows you to authenticate against PAM using OmniAuth.

## Usage

    use OmniAuth:Strategies::PAM

There are no configuration options. It's been tested under Debian 6.0 (Squeeze) and Ruby 1.9.3, but there's no reason why it won't work anywhere which doesn't have PAM correctly configured. _Note: The above is assumed for Sinatra, check the OmniAuth docs for Rails, et. al. usage._

Then navigate to '/auth/pam'.

On Debian/Ubuntu you will need the `libpam0g-dev` package to compile the [rpam](https://github.com/canweriotnow/rpam-ruby19) gem. Others, I don't know.

This strategy only supports Ruby 1.9. [Read here about 1.8 support](http://nickcharlton.net/post/pam-for-omniauth).

## Author / License

Copyright Nick Charlton 2012. Licensed under the MIT license.

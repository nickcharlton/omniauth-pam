# OmniAuth PAM

Allows you to authenticate against PAM using OmniAuth.

## Usage

    use OmniAuth:Strategies::PAM

There are no configuration options. It's been tested under Debian 6.0 (Squeeze) 
and Ruby 1.9.3, but there's no reason why it won't work anywhere which doesn't 
have PAM correctly configured. 
_Note: The above is assumed for Sinatra, check the OmniAuth docs for Rails, et. al. usage._

Then navigate to '/auth/pam'.

On Debian/Ubuntu you will need the `libpam0g-dev` package to compile the [rpam][] 
gem. YMMV with others.

This strategy only supports Ruby 1.9. [Read here about 1.8 support][oldruby].

## Credits

Originally hacked together by [Nick Charlton][nick], with modifications by 
[Jaakko Kantojärvi][jaakko] for GitLab support. Licensed under the MIT license.

[rpam]: https://github.com/canweriotnow/rpam-ruby19
[oldruby]: http://nickcharlton.net/post/pam-for-omniauth
[nick]: https://github.com/nickcharlton
[jaakko]: https://github.com/raphendyr


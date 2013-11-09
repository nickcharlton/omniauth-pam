# omniauth-pam example

This is a very simple example to demonstrate how OmniAuth::PAM can be used within a
primitive [Sinatra][] application.

You can start it by doing:

```bash
[sudo] gem install bundler foreman
bundle install
foreman start
```

Preferably from within the Vagrantfile included in the root of the repository.

## Usage

1. Go to http://localhost:5000
2. You'll be redirected to a login page.
3. Enter a system user account (for example: vagrant/vagrant).
4. Then, you'll be redirected to another page listing the auth hash details.


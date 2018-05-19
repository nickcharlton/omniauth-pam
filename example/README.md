# omniauth-pam example

This is a very simple example to demonstrate how OmniAuth::PAM can be used within a
primitive [Sinatra][] application.

You can start it by doing:

```bash
sudo apt-get install bundler # or: sudo gem install bundler
bundle install --path vendor/bundle
bundle exec rackup
```

Preferably from within the Vagrantfile included in the root of the repository.

## Usage

1. Go to http://localhost:9292
2. You'll be redirected to a login page.
3. Enter a system user account (for example: vagrant/vagrant).
4. Then, you'll be redirected to another page listing the auth hash details.

[Sinatra]: http://www.sinatrarb.com

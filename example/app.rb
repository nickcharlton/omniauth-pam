class App < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Strategies::PAM

  get '/' do
    'Hello World'
  end
end

class App < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Strategies::PAM, email_domain: "localhost.localdomain"

  helpers do
    def ensure_auth
      unless session[:auth]
        redirect '/auth/pam'
      end
    end
  end

  get '/' do
    ensure_auth
  end

  # OmniAuth support
  post '/auth/:name/callback' do
    auth = request.env['omniauth.auth']
    puts auth

    <<-HTML
    <h1>Authenticated via #{auth[:provider]}.</h1>

    <ul>
      <li>name: #{auth.info[:name]}</li>
      <li>nickname: #{auth.info[:nickname]}</li>
      <li>email: #{auth.info[:email]}</li>
      <li>uid: #{auth[:uid]}</li>
    </ul>
    HTML
  end
end

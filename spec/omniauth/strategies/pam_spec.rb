require "spec_helper"

describe OmniAuth::Strategies::PAM do
  before(:all) do
    Rpam2.fake_data =
      {
        usernames: Set["authur"],
        servicenames: Set["rpam", nil],
        password: "a_password",
        env:
          {
            email: "me@example.com",
            name: "Authur Dent",
          },
      }
  end

  describe "#request_phase" do
    it "displays a form" do
      get "/auth/pam"

      expect(last_response.body).to include("<form")
    end
  end

  describe "#callback_phase" do
    context "with valid credentials" do
      it "populates the auth hash" do

        post "/auth/pam/callback", valid_credentials

        expect(auth_hash["provider"]).to eq("pam")
        expect(auth_hash["uid"]).to eq("authur")
        expect(auth_hash["info"]["name"]).to eq("Authur Dent")
      end
    end

    context "with invalid credentials" do
      it "redirects to /auth/failure" do

        post "/auth/pam/callback", invalid_credentials

        expect(last_response).to be_redirect
        expect(last_response.headers["Location"]).to eq(
          "/auth/failure?message=invalid_credentials&strategy=pam",
        )
      end
    end
  end

  private

  def app
    Rack::Builder.new do
      use Rack::Session::Cookie, secret: "xyz"
      use OmniAuth::Strategies::PAM

      run lambda { |env| [404, { "env" => env }, ["PAM Strategy App"]] }
    end.to_app
  end

  def auth_hash
    last_response.headers["env"]["omniauth.auth"]
  end

  def valid_credentials
    { username: "authur", password: "a_password" }
  end

  def invalid_credentials
    { username: "not_a_valid_user", password: "not_a_valid_password" }
  end

end

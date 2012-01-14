module OmniAuth
  module Strategies
    class PAM
      include OmniAuth::Strategy

      option :fields, [:username]
      option :uid_field, :username

      def request_phase
        OmniAuth::Form.build(
          :title => (options[:title] || "Authenticate"), 
          :url => callback_path
        ) do |field|
          field.text_field 'Username', 'username'
          field.password_field 'Password', 'password'
        end.to_response
      end

      def callback_phase
        unless Rpam.auth(request['username'], request['password'])
          return fail!(:invalid_credentials)
        end

        super
      end

      uid do
        request['username']
      end
    end
  end
end

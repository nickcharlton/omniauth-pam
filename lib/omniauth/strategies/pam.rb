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
        rpam_opts = Hash.new
        rpam_opts['service'] = options['service'] unless options['service'].nil?

        unless Rpam.auth(request['username'], request['password'], rpam_opts)
          return fail!(:invalid_credentials)
        end

        super
      end

      uid do
        request['username']
      end

      info do
        {
          :nickname => uid,
          :name => uid
        }
      end
    end
  end
end

OmniAuth.config.add_camelization 'pam', 'PAM'

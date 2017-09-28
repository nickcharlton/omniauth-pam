module OmniAuth
  module Strategies
    class PAM
      include OmniAuth::Strategy

      option :name, 'pam'
      option :fields, [:username]
      option :uid_field, :username
      # if provided, info.email is build using uid@email_domain if :email is not found in pam environment
      option :email_domain, nil
      # pam service name passed to rpam2 (/etc/pam.d/service_name), if not provided rpam2 uses 'rpam'
      option :service, nil

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
        return fail!(:invalid_credentials) unless Rpam2.auth(options[:service], uid, request['password'])
        super
      end

      uid do
        request['username']
      end

      info do
        info = { nickname: uid, name: uid }
        # if authentication fails fall back to empty dictionary
        info.merge!(Rpam2.listenv(options[:service], uid, request['password'], false) || {})
        # info should contain now email if in pam environment and authentication successful
        # fallback if email is not in listenv
        info[:email] = "#{uid}@#{options[:email_domain]}" if info[:email].nil? && !options[:email_domain].nil?
        info
      end
    end
  end
end

OmniAuth.config.add_camelization 'pam', 'PAM'

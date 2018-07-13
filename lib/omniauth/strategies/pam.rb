module OmniAuth
  module Strategies
    class PAM
      include OmniAuth::Strategy

      option :name, 'pam'
      option :fields, [:username]
      option :uid_field, :username
      # if provided, info.email is build using uid@email_domain
      # this is used if :email is not found in pam environment
      option :email_domain, nil
      # pam service name passed to rpam2 (/etc/pam.d/service_name)
      # if not provided rpam2 uses 'rpam'
      option :service, nil

      def request_phase
        OmniAuth::Form.build(
          title: (options[:title] || "Authenticate"),
          url: callback_path,
        ) do |field|
          field.text_field 'Username', 'username'
          field.password_field 'Password', 'password'
        end.to_response
      end

      def callback_phase
        unless Rpam2.auth(options[:service], uid, request["password"])
          return fail!(:invalid_credentials)
        end
        super
      end

      uid do
        request['username']
      end

      info do
        info = { nickname: uid, name: uid }
        rpam_env = Rpam2.listenv(options[:service], uid, request["password"])
        # if authentication fails fall back to empty dictionary
        info.merge!(rpam_env || {})
        # info should contain now email if email in pam environment
        #   and authentication successful
        # fallback if email is not in listenv
        if info[:email].nil? && !options[:email_domain].nil?
          info[:email] = "#{uid}@#{options[:email_domain]}"
        end
        info
      end
    end
  end
end

OmniAuth.config.add_camelization 'pam', 'PAM'

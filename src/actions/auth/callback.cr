class Auth::Callback < BrowserAction
  get "/callback" do
    OauthClient.run do |operation, oauth_client|
      oauth_client = oauth_client.not_nil!

      code = params.get(:code)
      access_token = oauth_client.get_access_token_using_authorization_code(code)

      token = access_token.access_token

      # Decode and validate token
      begin
        payload, header = JWT.decode(
          token: token,
          key: ENV["FUSIONAUTH_HMAC_SECRET"],
          algorithm: JWT::Algorithm::HS256,
          iss: ENV["FUSIONAUTH_ISSUER"],
          aud: ENV["FUSIONAUTH_CLIENT_ID"]
        )

        Log.info { payload.to_json }

        session.set(SESSION_KEY, payload.to_json)
      rescue error : JWT::VerificationError
        flash.failure = "verification error"
        # TODO: redirect to error page
        return head :forbidden
      rescue error : JWT::DecodeError
        flash.failure = "bad stuff happened"
        # TODO: redirect to error page
        return head :forbidden
      rescue error : JWT::Error
        flash.failure = "An unexpected exception occurred: #{error.message}"
        # TODO: redirect to error page
        return head :forbidden
      end

      redirect to: Home::Generator
    end
  end
end

class Auth::Callback < BrowserAction
  include Auth::AllowGuests

  get "/callback" do
    code = params.get?(:code)

    if code.nil?
      flash.failure = "code not found"
      # TODO: redirect to error page
      return head :forbidden
    end

    begin
      access_token = FusionAuthOauthClient.get_access_token(code)
      token = access_token.access_token

      FusionAuthTokenDecoder.decode(token)

      Log.info { token }

      session.set(Auth::CurrentUser::SESSION_KEY, token)
    rescue error : OAuth2::Error
      flash.failure = "oauth2 error: #{error.message}"
      # TODO: redirect to error page
      return head :forbidden
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

    Auth::RequestedPath.redirect_to_originally_requested_path(self, fallback: Home::Generator)
  end
end

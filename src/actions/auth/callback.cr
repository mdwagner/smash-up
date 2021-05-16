class Auth::Callback < BrowserAction
  include Auth::AllowGuests

  param code : String?

  get "/callback" do
    if code.nil?
      return render_error_page("Code not found", :forbidden)
    end

    begin
      access_token = FusionAuthOauthClient.get_access_token(code.not_nil!)
      token = access_token.access_token

      FusionAuthTokenDecoder.decode(token)

      Log.info { token }

      session.set(Auth::CurrentUser::SESSION_KEY, token)
    rescue error : OAuth2::Error
      return render_error_page("OAuth2 Error: #{error.message}", :forbidden)
    rescue error : JWT::VerificationError
      return render_error_page("Verification Error", :forbidden)
    rescue error : JWT::DecodeError
      return render_error_page("Bad stuff happened", :forbidden)
    rescue error : JWT::Error
      return render_error_page(
        "An unexpected exception occurred: #{error.message}",
        :forbidden
      )
    end

    Auth::RequestedPath.redirect_to_originally_requested_path(self, fallback: Home::Generator)
  end
end

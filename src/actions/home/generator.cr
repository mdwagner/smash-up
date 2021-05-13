class Home::Generator < BrowserAction
  get "/smash_up" do
    # token = session.get?(SESSION_KEY)

    # begin
    #   JWT.decode(
    #     token: token.not_nil!,
    #     key: ENV["FUSIONAUTH_HMAC_SECRET"],
    #     algorithm: JWT::Algorithm::HS256,
    #     iss: ENV["FUSIONAUTH_ISSUER"],
    #     aud: ENV["FUSIONAUTH_CLIENT_ID"]
    #   )
    # rescue
    #   return redirect to: Auth::Logout
    # end

    flash.success = "Token found"

    html GeneratorPage
  end
end

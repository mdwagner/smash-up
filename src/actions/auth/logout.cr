class Auth::Logout < BrowserAction
  include Auth::AllowGuests

  get "/logout" do
    session.get?(Auth::CurrentUser::SESSION_KEY).try do |token|
      FusionAuthOauthClient.logout(token) do |response|
        case response.status_code
        when 302
          Log.info { "Successfully logged out" }
        else
          Log.warn { "Failed to logout of FusionAuth" }
        end
      end
    end

    session.clear

    # flash.keep
    flash.success = "You've been successfully logged out"

    redirect to: Home::Index
  end
end

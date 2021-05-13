class Auth::Logout < BrowserAction
  get "/logout" do
    OauthClient.run do |operation, oauth_client|
      oauth_client = oauth_client.not_nil!

      token = session.get?(SESSION_KEY)
      if token
        http_client = HTTP::Client.new(ENV["FUSIONAUTH_HOST"], tls: true)
        http_client.before_request do |request|
          request.headers["Authorization"] = "Bearer #{token}"
        end
        http_client.get "/oauth2/logout" do |response|
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
end

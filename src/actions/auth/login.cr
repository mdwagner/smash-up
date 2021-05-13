class Auth::Login < BrowserAction
  get "/login" do
    OauthClient.run do |operation, oauth_client|
      oauth_client = oauth_client.not_nil!
      redirect to: oauth_client.get_authorize_uri
    end
  end
end

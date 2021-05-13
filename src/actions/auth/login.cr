class Auth::Login < BrowserAction
  get "/login" do
    redirect to: FusionAuthOauthClient.authorize_uri
  end
end

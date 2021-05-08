class Auth::Login::New < BrowserAction
  get "/login" do
    html Auth::LoginPage
  end
end

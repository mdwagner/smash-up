class Auth::SignUp::New < BrowserAction
  get "/sign_up" do
    html Auth::SignUpPage
  end
end

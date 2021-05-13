class Home::Index < BrowserAction
  include Auth::RedirectSignedInUsers

  get "/" do
    html IndexPage
  end
end

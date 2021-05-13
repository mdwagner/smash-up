class Home::Generator < BrowserAction
  get "/smash_up" do
    html GeneratorPage
  end
end

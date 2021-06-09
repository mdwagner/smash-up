class Home::Index < BrowserAction
  get "/" do
    html GeneratorPage
  end
end

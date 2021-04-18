class Home::Index < BrowserAction
  param run : Bool = false

  get "/" do
    html IndexPage, run: run
  end
end

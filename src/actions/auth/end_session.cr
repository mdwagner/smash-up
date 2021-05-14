class Auth::EndSession < BrowserAction
  include Auth::AllowGuests

  get "/end_session" do
    session.clear
    flash.success = "You've been successfully logged out"
    redirect to: Home::Index
  end
end

# class Auth::Logout < BrowserAction
#   include Auth::AllowGuests

#   get "/logout" do
#     session.clear
#     redirect to: FusionAuthOauthClient.logout_url
#   end
# end

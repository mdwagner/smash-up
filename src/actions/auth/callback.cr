# class Auth::Callback < BrowserAction
#   include Auth::AllowGuests

#   param code : String?

#   get "/callback" do
#     handle_callback
#   end

#   private def handle_callback
#     access_token = FusionAuthOauthClient.get_access_token(code.not_nil!)
#     token = access_token.access_token

#     FusionAuthTokenDecoder.decode(token)

#     session.set(Auth::CurrentUser::SESSION_KEY, token)

#     Auth::RequestedPath.redirect_to_originally_requested_path(self, fallback: Home::Generator)
#   rescue error : OAuth2::Error
#     render_error_page("OAuth2 Error: #{error.message}", :forbidden)
#   rescue error : JWT::VerificationError
#     render_error_page("Verification Error", :forbidden)
#   rescue error : JWT::DecodeError
#     render_error_page("Bad stuff happened", :forbidden)
#   rescue error : JWT::Error
#     render_error_page(
#       "An unexpected exception occurred: #{error.message}",
#       :forbidden
#     )
#   rescue
#     render_error_page("Code not found", :forbidden)
#   end
# end

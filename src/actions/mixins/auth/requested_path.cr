module Auth::RequestedPath
  extend self

  # Remember the originally requested path if it is a GET
  #
  # Call this if the user requested an action that requires sign in.
  # It will remember the path they requested if it is a get.
  #
  # Once the user signs in call `redirect_to_originally_requested_path`
  # to redirect them back.
  def self.remember_requested_path(action : Lucky::Action) : Void
    if action.request.method.upcase == "GET"
      action.session.set(:return_to, action.request.resource)
    end
  end

  # After successful sign in, call this to redirect back to the originally request path
  #
  # First call `remember_requested_path` if the user is not signed in.
  # Then call this to redirect them. A `fallback` action is required. The
  # `fallback` action will be used if user was not trying to access a protected
  # page before sign in.
  def self.redirect_to_originally_requested_path(
    action : Lucky::Action,
    fallback : Lucky::Action.class | Lucky::RouteHelper
  ) : Lucky::Response
    return_to = action.session.get?(:return_to)
    action.session.delete(:return_to)
    action.redirect to: return_to || fallback
  end
end

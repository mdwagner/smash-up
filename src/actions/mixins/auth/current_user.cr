module Auth::CurrentUser
  SESSION_KEY = "user_jwt"

  # Returns the signed in user if signed in, otherwise returns `nil`
  #
  # This method is often overridden by different modules/pipes. For example,
  # When sign in is required this method is typically overridden by calling
  # `not_nil!` since the user will always be returned.
  def current_user : User?
    current_user?
  end

  # Return the signed in user if signed in, otherwise returns `nil`
  #
  # This method should *not* be overridden. If you want to require a current user,
  # override the `current_user` method (note no `?`).
  def current_user? : User?
    session.get?(SESSION_KEY).try do |token|
      FusionAuthTokenDecoder.decode?(token).try do |(payload, header)|
        User.from_json(payload.to_json)
      end
    end
  end
end

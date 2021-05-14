module FusionAuthOauthClient
  extend self

  def authorize_uri
    init.get_authorize_uri
  end

  def logout_url
    uri = URI.parse("#{ENV["FUSIONAUTH_URL"]}/oauth2/logout")
    uri.query = URI::Params.encode({client_id: ENV["FUSIONAUTH_CLIENT_ID"]})
    uri.to_s
  end

  def get_access_token(code)
    init.get_access_token_using_authorization_code(code)
  end

  private def init
    base_uri = AppConfig.base_uri
    callback_path = Auth::Callback.route.path

    OAuth2::Client.new(
      host: ENV["FUSIONAUTH_HOST"],
      client_id: ENV["FUSIONAUTH_CLIENT_ID"],
      client_secret: ENV["FUSIONAUTH_CLIENT_SECRET"],
      redirect_uri: "#{base_uri}#{callback_path}"
    )
  end
end

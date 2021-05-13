module FusionAuthOauthClient
  extend self

  def authorize_uri
    init.get_authorize_uri
  end

  def logout(token)
    http_client = HTTP::Client.new(ENV["FUSIONAUTH_HOST"], tls: true)
    http_client.before_request do |request|
      request.headers["Authorization"] = "Bearer #{token}"
    end
    http_client.get "/oauth2/logout" do |response|
      yield response
    end
  end

  def get_access_token(code)
    init.get_access_token_using_authorization_code(code)
  end

  private def init
    base_uri = BaseURI.url
    callback_path = Auth::Callback.route.path

    OAuth2::Client.new(
      host: ENV["FUSIONAUTH_HOST"],
      client_id: ENV["FUSIONAUTH_CLIENT_ID"],
      client_secret: ENV["FUSIONAUTH_CLIENT_SECRET"],
      redirect_uri: "#{base_uri}#{callback_path}"
    )
  end
end

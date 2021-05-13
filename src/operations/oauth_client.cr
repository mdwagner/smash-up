class OauthClient < Avram::Operation
  def run
    OAuth2::Client.new(
      host: ENV["FUSIONAUTH_HOST"],
      client_id: ENV["FUSIONAUTH_CLIENT_ID"],
      client_secret: ENV["FUSIONAUTH_CLIENT_SECRET"],
      redirect_uri: "#{Lucky::RouteHelper.settings.base_uri}#{Auth::Callback.route.path}"
    )
  end
end

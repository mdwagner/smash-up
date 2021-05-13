module FusionAuthTokenDecoder
  extend self

  def decode(token)
    JWT.decode(
      token: token,
      key: ENV["FUSIONAUTH_HMAC_SECRET"],
      algorithm: JWT::Algorithm::HS256,
      iss: ENV["FUSIONAUTH_ISSUER"],
      aud: ENV["FUSIONAUTH_CLIENT_ID"]
    )
  end
end

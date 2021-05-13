class BaseURI
  Habitat.create do
    setting lucky_server_url : String
    setting lucky_server_proxy_url : String
  end

  def self.url
    if Lucky::Env.production?
      settings.lucky_server_url
    else
      settings.lucky_server_proxy_url
    end
  end
end

BaseURI.configure do |settings|
  settings.lucky_server_url = "http://localhost:#{Lucky::ServerSettings.port}"
  settings.lucky_server_proxy_url = "http://localhost:3001"
end

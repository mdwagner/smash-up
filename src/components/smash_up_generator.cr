class SmashUpGenerator < BaseComponent
  def render
    spotify_token = fetch_spotify_access_token
    artist = random_artist_spotify(spotify_token).try { |x| x["name"].as_s } || ""
    song, song_by_artists = random_song_spotify(spotify_token, artist).try do |x|
      [x["name"].as_s, x["artists"].as_a.map { |t| t["name"].as_s }.join(", ")]
    end || ""

    div class: "flex flex-col items-center space-y-5 text-5xl md:text-6xl" do
      span artist
      span "+"
      span "#{song} by #{song_by_artists}"
    end

    div class: "flex flex-row items-center justify-center mt-12" do
      link "Reload", to: Home::Index, class: "inline-block py-2 px-4 text-5xl leading-normal rounded-lg text-gray-200 font-semibold hover:text-gray-100 bg-red-700"
    end
  end

  private def fetch_spotify_access_token
    token = Base64.urlsafe_encode("#{ENV["SPOTIFY_CLIENT_ID"]}:#{ENV["SPOTIFY_CLIENT_SECRET"]}")

    response = HTTP::Client.post("https://accounts.spotify.com/api/token",
      headers: HTTP::Headers{
        "Authorization" => "Basic #{token}",
        "Accept"        => "application/json",
        "Content-Type"  => "application/json",
      },
      form: "grant_type=client_credentials"
    )

    json = JSON.parse(response.body)
    token_type = json["token_type"].as_s
    access_token = json["access_token"].as_s

    "#{token_type} #{access_token}"
  end

  private def random_artist_spotify(token)
    uri = URI.parse("https://api.spotify.com/v1/search")
    uri.query = URI::Params.encode({
      "q"      => %q(genre:"pop"),
      "type"   => "artist",
      "market" => "US",
      "limit"  => "30",
    })
    response = HTTP::Client.get(uri, headers: HTTP::Headers{
      "Authorization" => token,
      "Accept"        => "application/json",
      "Content-Type"  => "application/json",
    })

    if response.success?
      json = JSON.parse(response.body)
      artists = json["artists"]["items"].as_a

      artists.each do |artist|
        Log.debug do
          {
            name: artist["name"].as_s,
            id:   artist["id"].as_s,
            type: artist["type"].as_s,
          }
        end
      end

      Log.debug { "---------" }

      artist = artists.sample
      Log.debug do
        {
          name: artist["name"].as_s,
          id:   artist["id"].as_s,
          type: artist["type"].as_s,
        }
      end

      artist
    else
      Log.debug { "#{response.status_code}: #{response.body}" }
      nil
    end
  end

  private def random_song_spotify(token, except_artist)
    uri = URI.parse("https://api.spotify.com/v1/search")
    uri.query = URI::Params.encode({
      "q"      => %q(genre:"pop" NOT ) + "artist:\"#{except_artist}\"",
      "type"   => "track",
      "market" => "US",
      "limit"  => "30",
    })
    response = HTTP::Client.get(uri, headers: HTTP::Headers{
      "Authorization" => token,
      "Accept"        => "application/json",
      "Content-Type"  => "application/json",
    })

    if response.success?
      json = JSON.parse(response.body)

      tracks = json["tracks"]["items"].as_a

      tracks.each do |track|
        Log.debug do
          {
            name:    track["name"].as_s,
            id:      track["id"].as_s,
            type:    track["type"].as_s,
            artists: track["artists"].as_a.map { |t| t["name"].as_s }.join(", "),
            album:   track["album"]["name"].as_s,
          }
        end
      end

      Log.debug { "---------" }

      track = tracks.sample

      Log.debug do
        {
          name:    track["name"].as_s,
          id:      track["id"].as_s,
          type:    track["type"].as_s,
          artists: track["artists"].as_a.map { |t| t["name"].as_s }.join(", "),
          album:   track["album"]["name"].as_s,
        }
      end

      track
    else
      Log.debug { "#{response.status_code}: #{response.body}" }
      nil
    end
  end
end

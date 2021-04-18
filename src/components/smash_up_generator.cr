class SmashUpGenerator < BaseComponent
  MUSIC = {
    "Ninja Sex Party" => [
      "Release the Kraken",
      "Danny Don't you Know",
    ],
    "TWRP" => [
      "The Hit",
      "Atomic Karate",
    ],
    "Elton John" => [
      "Rocket Man",
      "Tiny Dancer",
    ],
    "Queen" => [
      "Don't Stop Me Know",
      "We Will Rock You",
    ],
    "AC/DC" => [
      "Back in Black",
      "Highway to Hell",
    ],
  }

  def render
    artist = random_artist
    song = random_song(artist)

    div class: "flex flex-row space-x-5 text-lg" do
      span artist
      span "+"
      span song
    end
  end

  private def random_artist
    MUSIC.keys.sample
  end

  private def random_song(artist)
    MUSIC.reject(artist).values.flatten.sample
  end
end

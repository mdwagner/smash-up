class Home::IndexPage < MainLayout
  needs run : Bool

  def content
    if run?
      mount SmashUpGenerator
    else
      h1 "Welcome to SmashUp!", class: "text-xl"
      h2 "a fun game for drunk parties", class: "text-lg"
    end
    link "SmashUp", to: Home::Index.with(run: true), class: "text-red-700 font-semibold hover:text-red-500"
  end
end

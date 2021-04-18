class Home::IndexPage < MainLayout
  needs run : Bool

  def content
    if run?
      mount SmashUpGenerator
    else
      h1 "Welcome to SmashUp!", class: "text-xl"
      h2 "a fun game for drunk parties", class: "text-lg"
    end
    div class: "flex flex-row space-x-3" do
      link "SmashUp", to: Home::Index.with(run: true), class: "text-red-600"
      span "|"
      link "Cancel", to: Home::Index, class: "text-blue-600"
    end
  end
end

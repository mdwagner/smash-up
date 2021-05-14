class Home::IndexPage < PublicLayout
  def content
    div class: "flex flex-col items-center justify-center space-y-5" do
      div do
        h1 "Welcome to SmashUp!", class: "text-5xl"
        h2 "a fun game for drunk parties", class: "text-4xl"
      end
    end
  end
end

class Home::IndexPage < MainLayout
  def content
    div class: "flex flex-col items-center justify-center space-y-5" do
      div do
        h1 "Welcome to SmashUp!", class: "text-5xl"
        h2 "a fun game for drunk parties", class: "text-4xl"
      end
      div class: "flex-row" do
        link "SmashUp", to: Home::Generator, class: "inline-block py-2 px-4 text-5xl leading-normal rounded-lg text-gray-200 font-semibold hover:text-gray-100 bg-red-700"
      end
    end
  end
end

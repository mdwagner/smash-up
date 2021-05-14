class Home::OtherPage < MainLayout
  add_breadcrumb name: "Smash Up"
  add_breadcrumb name: "Other"

  def content
    h1 class: "text-3xl" do
      text "Other private page!"
    end
  end
end

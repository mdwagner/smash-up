class Home::GeneratorPage < MainLayout
  add_breadcrumb name: "Home", page: Home::Index
  add_breadcrumb name: "Smash Up"

  def content
    mount SmashUpGenerator
  end
end

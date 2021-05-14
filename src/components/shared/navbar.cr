class Shared::Navbar < BaseComponent
  def render
    nav class: "bg-green-700 py-3 px-4 flex justify-between items-center" do
      yield
    end
  end
end

class Shared::Body < BaseComponent
  def render
    body class: "flex flex-col h-screen bg-gray-100" do
      yield
    end
  end
end

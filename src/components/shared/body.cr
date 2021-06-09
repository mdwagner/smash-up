class Shared::Body < BaseComponent
  def render
    body class: "flex flex-col h-screen bg-gray-100", attrs: [:x_data, :x_cloak] do
      mount Shared::React
      yield
    end
  end
end

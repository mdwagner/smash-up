class Shared::Content < BaseComponent
  def render
    main class: "flex-1 p-4" do
      yield
    end
  end
end

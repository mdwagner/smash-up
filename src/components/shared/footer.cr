class Shared::Footer < BaseComponent
  def render
    footer class: "p-6 bg-green-900 text-indigo-300 flex justify-center flex-shrink-0" do
      div class: "flex items-center" do
        text "Copyright"
        nbsp
        raw "&copy;"
        nbsp
        text "Wagz & Wil 2021"
      end
    end
  end
end

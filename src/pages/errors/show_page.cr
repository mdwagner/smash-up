class Errors::ShowPage < ErrorLayout
  needs message : String
  needs status : HTTP::Status

  def content
    div class: "container" do
      h2 status.code, class: "text-2xl font-normal"
      h1 message, class: "text-4xl font-normal"

      ul do
        li do
          link "Try heading back to home",
            to: Home::Index,
            class: "text-indigo-300"
        end
      end
    end
  end
end

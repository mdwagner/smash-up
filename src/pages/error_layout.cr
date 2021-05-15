abstract class ErrorLayout < BaseLayout
  abstract def content

  def render
    html_render do
      mount Shared::LayoutHead, page_title: "Something went wrong", context: context

      mount Shared::Body do
        mount Shared::Navbar do
          div class: "flex items-center" do
            link to: Home::Index, class: "inline-block p-2" do
              img src: asset("images/Spotify-512.png"), alt: "Spotify logo", width: "55"
            end
          end
        end

        mount Shared::Content do
          content
        end

        mount Shared::Footer
      end
    end
  end
end

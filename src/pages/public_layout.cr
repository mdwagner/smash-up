abstract class PublicLayout < BaseLayout
  abstract def content

  def render
    html_render do
      mount Shared::LayoutHead, page_title: "Welcome to SmashUp", context: context

      mount Shared::Body do
        mount Shared::React

        mount Shared::Navbar do
          div class: "flex items-center" do
            link to: Home::Index, class: "inline-block p-2" do
              img src: asset("images/Spotify-512.png"), alt: "Spotify logo", width: "55"
            end
          end

          div class: "flex items-center space-x-1 sm:space-x-3" do
            link "Login", to: Auth::Login, class: "inline-block p-2 text-indigo-200 hover:text-indigo-100"
            # link "Sign Up", to: Auth::SignUp::New, class: "inline-block py-2 px-4 whitespace-nowrap text-yellow-700 bg-yellow-400 rounded hover:bg-yellow-300 hover:text-yellow-800 transition ease-in duration-150"
          end
        end

        mount Shared::FlashMessages, flash: context.flash

        mount Shared::Content do
          content
        end

        mount Shared::Footer
      end
    end
  end
end

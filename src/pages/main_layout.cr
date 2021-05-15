abstract class MainLayout < BaseLayout
  include BreadcrumbHelpers

  needs current_user : JSON::Any?

  abstract def content

  def render
    html_render do
      mount Shared::LayoutHead, page_title: "SmashUp", context: context

      mount Shared::Body do
        mount Shared::Navbar do
          div class: "flex items-center" do
            link to: Home::Index, class: "inline-block p-2" do
              img src: asset("images/Spotify-512.png"), alt: "Spotify logo", width: "55"
            end
          end

          div class: "flex items-center space-x-1 sm:space-x-3" do
            link "Logout", to: Auth::Logout, class: "inline-block p-2 text-indigo-200 hover:text-indigo-100"
          end
        end

        mount Shared::FlashMessages, flash: context.flash

        mount Breadcrumbs, breadcrumbs: breadcrumbs

        mount Shared::Content do
          content
        end

        mount Shared::Footer
      end
    end
  end
end

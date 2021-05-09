abstract class MainLayout
  include Lucky::HTMLPage
  include BreadcrumbHelpers

  abstract def content

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: "Welcome to SmashUp", context: context

      body class: "flex flex-col h-screen bg-gray-100" do
        nav class: "bg-green-700 py-3 px-4 flex justify-between items-center" do
          div class: "flex items-center" do
            link to: Home::Index, class: "inline-block p-2" do
              img src: asset("images/Spotify-512.png"), alt: "Spotify logo", width: "55"
            end
          end

          div class: "flex items-center space-x-1 sm:space-x-3" do
            link "Login", to: Auth::Login::New, class: "inline-block p-2 text-indigo-200 hover:text-indigo-100"
            link "Sign Up", to: Auth::SignUp::New, class: "inline-block py-2 px-4 whitespace-nowrap text-yellow-700 bg-yellow-400 rounded hover:bg-yellow-300 hover:text-yellow-800 transition ease-in duration-150"
          end
        end

        mount Shared::FlashMessages, flash: context.flash

        if breadcrumbs.size > 0
          para class: "px-4 py-2" do
            breadcrumbs.each do |bc|
              bc_class = "text-green-500 text-2xl"

              if bc[:page]
                link bc[:name], to: bc[:page].not_nil!, class: "#{bc_class} hover:underline hover:text-green-300"
              else
                a class: "#{bc_class} hover:cursor-default" do
                  text bc[:name]
                end
              end

              span class: "last:hidden text-green-500 text-2xl hover:cursor-default" do
                nbsp
                text ">"
                nbsp
              end
            end
          end
        end

        main class: "flex-1 p-4" do
          content
        end

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
  end
end

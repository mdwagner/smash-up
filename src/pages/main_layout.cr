abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content

  def page_title
    "Welcome to SmashUp"
  end

  def render_custom_head
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title, context: context do
        render_custom_head
      end

      body class: "flex flex-col h-screen" do
        nav class: "bg-indigo-700 py-3 px-4 flex justify-between items-center" do
          div class: "flex items-center space-x-0.5 sm:space-x-3" do
            img src: asset("images/Spotify-512.png"), alt: "Spotify logo", width: "55", class: "p-2"
            a href: "#", class: "inline-block p-2 text-indigo-200 hover:text-indigo-100" do
              text "Home"
            end
            a href: "#", class: "inline-block p-2 text-indigo-200 hover:text-indigo-100" do
              text "About"
            end
          end

          div class: "flex items-center space-x-1 sm:space-x-3" do
            a href: "#", class: "inline-block p-2 text-indigo-200 hover:text-indigo-100" do
              text "Login"
            end
            a href: "#", class: "inline-block py-2 px-4 whitespace-nowrap text-yellow-700 bg-yellow-400 rounded hover:bg-yellow-300 hover:text-yellow-800 transition ease-in duration-150" do
              text "Sign Up"
            end
          end
        end

        mount Shared::FlashMessages, context.flash

        main class: "flex-1 p-4" do
          content
        end

        footer class: "p-6 bg-indigo-900 text-indigo-400 flex justify-center flex-shrink-0" do
          div class: "flex items-center" do
            text "Copyright"
            text " "
            raw "&copy;"
            text " "
            text "Wagz & Wil 2021"
          end
        end
      end
    end
  end
end

abstract class AuthLayout
  include Lucky::HTMLPage

  abstract def content

  abstract def page_title

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title, context: context

      body class: "flex flex-col h-screen" do
        header do
          img src: "", alt: "logo"
        end

        mount Shared::FlashMessages, flash: context.flash

        main class: "flex-1 p-4" do
          content
        end

        footer do
          text "Contact Us plz"
        end
      end
    end
  end
end

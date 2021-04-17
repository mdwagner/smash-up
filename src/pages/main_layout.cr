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

      body do
        mount Shared::FlashMessages, context.flash
        content
      end
    end
  end
end

class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      utf8_charset
      title "My App - #{@page_title}"
      empty_tag "link", rel: "stylesheet", href: "https://unpkg.com/tailwindcss@2.1.1/dist/tailwind.min.css"
      css_link asset("css/app.css")
      js_link asset("js/app.js"), type: "application/javascript"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end

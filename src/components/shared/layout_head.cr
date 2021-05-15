class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      utf8_charset
      title page_title
      css_link asset("css/app.css")
      js_link dynamic_asset("js/manifest.js"), defer: "true"
      js_link dynamic_asset("js/vendor.js"), defer: "true"
      js_link asset("js/app.js"), defer: "true"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end

abstract class BaseLayout
  include Lucky::HTMLPage

  def html_render
    html_doctype

    html lang: "en" do
      yield
    end
  end
end

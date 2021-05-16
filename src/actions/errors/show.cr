# This class handles error responses and reporting.
#
# https://luckyframework.org/guides/http-and-routing/error-handling
class Errors::Show < Lucky::ErrorAction
  default_format :html
  include Errors::RenderError
  include Errors::Render
  include Errors::Report

  # Always keep this below other 'render' methods
  # or it may override your custom 'render' methods.
  def render(error : Lucky::RenderableError)
    if html?
      render_error_page(
        status: HTTP::Status.new(error.renderable_status)
      )
    else
      render_error_json(
        {"message" => error.renderable_message},
        status: HTTP::Status.new(error.renderable_status)
      )
    end
  end

  # If none of the 'render' methods return a response for the raised Exception,
  # Lucky will use this method.
  def default_render(error : Exception) : Lucky::Response
    if html?
      render_error_page
    else
      render_error_json
    end
  end
end

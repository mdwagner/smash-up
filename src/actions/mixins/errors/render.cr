module Errors::Render
  def render(error : Lucky::RouteNotFoundError | Avram::RecordNotFoundError)
    if html?
      render_error_page(
        "Sorry, we couldn't find that page.",
        status: HTTP::Status::NOT_FOUND
      )
    else
      render_error_json(
        "Not found",
        status: HTTP::Status::NOT_FOUND
      )
    end
  end

  # When the request is JSON and an InvalidOperationError is raised, show a
  # helpful error with the param that is invalid, and what was wrong with it.
  def render(error : Avram::InvalidOperationError)
    if html?
      render_error_page
    else
      render_error_json(
        {
          "message" => error.renderable_message,
          "details" => error.renderable_details,
          "param"   => error.invalid_attribute_name,
        },
        status: HTTP::Status::BAD_REQUEST
      )
    end
  end
end

module Errors::RenderError
  DEFAULT_MESSAGE = "Something went wrong."

  def render_error_page(
    message : String = DEFAULT_MESSAGE,
    status : HTTP::Status = :internal_server_error
  )
    context.response.status_code = status.code
    html Errors::ShowPage, message: message, status: status
  end

  def render_error_json(
    hash = {"message" => DEFAULT_MESSAGE},
    status : HTTP::Status = :internal_server_error
  )
    json hash, status: status.code
  end
end

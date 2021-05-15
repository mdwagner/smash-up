module Errors::Report
  macro included
    dont_report [Lucky::RouteNotFoundError, Avram::RecordNotFoundError]
  end

  def report(error : Exception) : Nil
    # Send to Rollbar, send an email, etc.
  end
end

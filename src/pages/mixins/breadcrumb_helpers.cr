module BreadcrumbHelpers
  alias Breadcrumb = NamedTuple(name: String, page: Lucky::Action.class | Nil)

  macro included
    class_property breadcrumbs = [] of Breadcrumb

    def self.add_breadcrumb(name : String, page : Lucky::Action.class)
      breadcrumbs << {name: name, page: page}
    end

    def self.add_breadcrumb(name : String)
      breadcrumbs << {name: name, page: nil}
    end
  end

  def breadcrumbs
    self.class.breadcrumbs
  end
end

class Breadcrumbs < BaseComponent
  needs breadcrumbs : Array(BreadcrumbHelpers::Breadcrumb)

  def render
    if breadcrumbs.size > 0
      para class: "px-4 py-2" do
        breadcrumbs.each do |bc|
          bc_class = "text-green-500 text-2xl"

          if bc[:page]
            link bc[:name], to: bc[:page].not_nil!, class: "#{bc_class} hover:underline hover:text-green-300"
          else
            a class: "#{bc_class} hover:cursor-default" do
              text bc[:name]
            end
          end

          span class: "last:hidden text-green-500 text-2xl hover:cursor-default" do
            nbsp
            text ">"
            nbsp
          end
        end
      end
    end
  end
end

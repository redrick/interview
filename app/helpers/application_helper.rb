module ApplicationHelper

  def form_component(slug, properties)
    component = "components/form/#{slug}"
    render component, locals: properties
  end

end

module ApplicationHelper

  def form_component(slug, properties)
    component = "components/form/#{slug}"
    render partial: component, locals: properties
  end

  # TODO: Find out how to use this with rendering collections (tasks.index.html.slim)
  def ui_component(slug, properties)
    component = "components/#{slug}"
    render partial: component, locals: properties
  end

end

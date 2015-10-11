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

  def errors_for(form, field)
    form.object.errors[field]
  end

  def form_group_class(errors)
    errors.any? ? 'form-group has-errors' : 'form-group'
  end
end

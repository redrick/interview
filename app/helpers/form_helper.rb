module FormHelper
  def errors_for(form, field)
    form.object.errors[field]
  end

  def form_group_class(errors)
    errors.any? ? 'form-group has-errors' : 'form-group'
  end
end

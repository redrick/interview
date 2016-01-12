module ApplicationHelper

  # return string
  def menu_item(ctrl, link)
    content_tag_for :li, class: (controller_name.to_sym == ctrl) ? 'active': '' do
        link
    end
  end

  def is_active_controller(ctrl)
    ctrl = Array.wrap(ctrl)
    (ctrl.include?(controller_name.to_sym)) ? "active" : nil
  end

  def fullname
    "#{current_user.name} #{current_user.surname}"
  end

  def add_or_update(object)
    return 'Add' if object && object.new_record?
    'Update'
  end

end

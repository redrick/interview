module UiHelper

  def btn_group_class(btn = nil)
    active_btn_class = 'btn btn-default active'
    btn_class = 'btn btn-default'
    params[:scope] == btn ? active_btn_class : btn_class
  end

end

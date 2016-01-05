module UiHelper

  def btn_group_class(btn = nil)
    active_btn_class = 'btn btn-default active'
    btn_class = 'btn btn-default'
    params[:scope] == btn ? active_btn_class : btn_class
  end

  def bootstrap_class_for_flash flash_type
    { success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    render 'application/flash'
  end

end

class UserAdmin < User

  def admin?
    true
  end

  def role
    'Admin'
  end
end

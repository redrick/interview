class UserAdmin < User
	def is_admin?
		true
	end

  def role
    'Admin'
  end
end

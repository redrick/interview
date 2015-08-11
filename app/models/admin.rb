class Admin < User
  def to_partial_path
    'user'
  end
end

class AdminController < AuthenticatedController
  before_action :admin_required!
end

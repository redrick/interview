class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_undone_count


  private

    def set_undone_count
      @undone_count = Task.undone.count
    end

end

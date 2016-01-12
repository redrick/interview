class Admin::UsersController < AdminController
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @users = User.ordered
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.js { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.js
      else
        format.js { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :surname, :password, :phone, :type)
  end

  def get_user
    @user = User.find(params[:id])
  end

end

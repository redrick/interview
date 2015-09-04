class UsersController < ApplicationController

  before_action :set_user_class
  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = @user_class.all
  end

  # GET /users/new
  def new
    @user = @user_class.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = @user_class.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{@user_class.to_s} was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user_class.to_s} was successfully updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = @user_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(params[:type].downcase).permit(:name, :surname, :email, :phone)
    end

    # Convert type param to actual STI class because we're using this same controller for now
    # Whitelist Member and Admin
    def set_user_class
      @user_class = params[:type].constantize if params[:type].in? ['Manager', 'Admin']
    end

end

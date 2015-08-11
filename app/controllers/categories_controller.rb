class CategoriesController < ApplicationController
  before_action :fetch_category, only: [:destroy, :toggle_done, :edit, :show, :update]
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category successfully created.'
    else
      flash.now[:alert] = 'Category creation failed!'
      render :new
    end
  end
  
  def destroy
    begin
      @category.destroy
      redirect_to :categories, notice: 'Category successfully destroyed.'
    rescue Exception => e
      redirect_to @category, alert: 'Category deletion failed!'
    end
  end
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def update
    if @category.update_attributes(category_params)
      redirect_to @category, notice: 'Category successfully updated.'
    else
      flash.now[:alert] = 'Category update failed!'
      render :edit
    end
  end
  
  private
  
  def fetch_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end

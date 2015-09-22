class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category successfully created."
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = "Category successfully updated."
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:success] = "Category successfully deleted."
    else
      flash[:danger] = "Error occurred, category has not been deleted."
    end

    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end

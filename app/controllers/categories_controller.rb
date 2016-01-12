class CategoriesController < AuthenticatedController

  before_action :get_category, only: [:edit, :update, :destroy]

  def index
    @categories = current_user.categories.ordered
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.js
      else
        format.js { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = current_user.categories.new(category_params)
    respond_to do |format|
      if @category.save
        format.js
      else
        format.js { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = current_user.categories.find(params[:id])
  end

end

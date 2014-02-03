class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user: current_user);
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = current_user.categories.build(category_params)
    @category.save

    redirect_to categories_path
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end

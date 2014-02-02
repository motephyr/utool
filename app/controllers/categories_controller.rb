class CategoriesController < ApplicationController
  def create
    @category = current_user.categories.build(category_params)
    @category.save

    redirect_to user_path(current_user)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end

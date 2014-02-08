class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user: current_user).order_by_id;
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save

      redirect_to categories_path
    else
      flash[:warning] = "類別名稱為空值或與其他類別同名。"
      render :new
    end
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      flash[:warning] = "類別名稱為空值或與其他類別同名。"
      render :edit
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    if @category.link.blank?
      @category.destroy
    else
      flash[:warning] = "這個類別仍含有其他連結，請將這個類別內所有的連結刪除或修改為其他類別"
    end
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end

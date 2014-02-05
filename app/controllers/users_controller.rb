class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @links = params[:category_id] ? @user.links.where(category_id: params[:category_id]) : @user.links
    @categories = @user.categories.order_by_id
    @category = Category.new
  end
end

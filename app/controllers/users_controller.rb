class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @links = params[:category_id] ? current_user.links.where(category_id: params[:category_id]) : current_user.links
    @categories = current_user.categories
  end
end

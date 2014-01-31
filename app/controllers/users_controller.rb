class UsersController < ApplicationController

  def show
    @links = current_user.links
  end
end

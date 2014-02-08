class HomesController < ApplicationController
  before_action :sign_up_required, only: [:index1]
  def index
     if current_user
      if current_user.links.blank?
        redirect_to index1_homes_path
      else
        redirect_to user_path(current_user)
      end
     end
  end
  def index1
  end
  def index2
  end
  def index3
  end
  def index4
  end
  def index5
  end
  def index6
  end

  # def index
  #   @homes = Home.all
  # end
  # def show
  #   @home = Home.find(params[:id])
    
  # end
  # def new
  #   @home = Home.new
  # end

  # def edit
  #   @home = Home.find(params[:id])
  # end

  # def create
  #   @home = Home.new(home_params)
  #   if @home.save
  #     redirect_to homes_path
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @home = Home.find(params[:id])
  #   if @home.update(home_params)
  #     redirect_to home_path(@home)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @home = Home.find(parms[:id])
  #   @home.destroy

  #   redirect_to homes_path
  # end
  # private
  # def home_params
  #   params.require(:home).permit(:title,:description)
  # end
end

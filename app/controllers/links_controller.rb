class LinksController < ApplicationController

  def index
    @links = params[:category_id] ? Link.where(category_id: params[:category_id]) : Link.all
    @categories = Category.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
    @categories = Category.where(user: current_user)

  end

  def edit
    @link = Link.find(params[:id])
    @categories = Category.where(user: current_user)

  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_path(@link)
    else
      render :edit
    end
  end
  def destroy
    @link = Link.find(params[:id])
    @link.destory

    redirect_to links_path

  end

  private
  def link_params
    params.require(:link).permit(:url,:category_id,:direction)
  end
end

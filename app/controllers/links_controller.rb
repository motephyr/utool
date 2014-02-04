class LinksController < ApplicationController

  def index
    if(params[:category_name])
      categories = Category.where(name: params[:category_name])
      @links = Link.where(category_id: categories) 
    else
      @links = Link.all
    end
  end

  def show
    @link = Link.find(params[:id])
    Link.increment_counter(:hits, params[:id])
  end

  def new
    @link = Link.new

    #預設加入"未分類"
    if current_user.categories.where(name: '未分類').empty?
      @category = current_user.categories.build(name: '未分類')
      @category.save   
    end 

    @categories = Category.where(user: current_user)

  end

  def edit
    @link = Link.find(params[:id])
    @categories = Category.where(user: current_user)

  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to user_path(current_user)
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
    @link.destroy

    redirect_to user_path(current_user)

  end

  private
  def link_params
    params.require(:link).permit(:url,:category_id,:direction)
  end
end

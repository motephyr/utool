class LinksController < ApplicationController

  def index
    if(params[:category_name])
      categories = Category.where(name: params[:category_name])
      @links = Link.where(category_id: categories).hot
    else
      @links = Link.hot
    end
  end

  def show
    @link = Link.find(params[:id])
    add_hit
  end

  def new
    @link = Link.new(category_id: params[:category_id])

    #預設加入"未分類"
    if current_user.categories.where(name: '未分類').blank?
      @category = current_user.categories.build(name: '未分類')
      @category.save   
    end 

    @categories = current_user.categories

  end

  def edit
    @link = current_user.links.find(params[:id])
    @categories = current_user.categories

  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to(new_link_path, flash: {info: "新增成功，再來幾個吧！"})
    else
      # FIX
      #render :new, category_id: @link.category_id
      redirect_to(new_link_path, flash: {warning: "未新增成功，請確認是否為有效網址或已有相同網址。"})
    end
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update(link_params)
      redirect_to link_path(@link)
    else
      render :edit
    end
  end
  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy

    redirect_to user_path(current_user)

  end

  def hit_once
    add_hit
    redirect_to params[:url]
  end

  def list_insert
    @link = current_user.links.find(params[:id])

    if @link.not_in_list?
      #重排順序
      current_user.links.each_with_index do |x, index| 
        Link.update_counters(x.id, position: index)
      end 
    end
    
    #將所移動的元素插入指定位置  
    @link.insert_at(1+params[:position].to_i)
    
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def add_hit
    Link.increment_counter(:hits, params[:id])
  end
  def link_params
    params.require(:link).permit(:url,:category_id,:direction,:summary)
  end

end

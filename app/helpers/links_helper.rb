module LinksHelper
  def render_link_title(title, link)
    link.blank? ?  "未設定" : link_to(title, link)
  end

  def render_link_image(link)
    image_tag(link.thumbnail_url ? link.thumbnail_url : 'noimage.jpg' , style: "vertical-align:middle;")
  end
end

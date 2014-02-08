module LinksHelper
  def set_title_link(title,link)
    link.blank? ?  "未設定" : link_to(title, link)
  end
end

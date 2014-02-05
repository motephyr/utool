module LinksHelper
  def set_title_link(title,link)
    link.empty? ?  "未設定" : link_to(title, link)
  end
end

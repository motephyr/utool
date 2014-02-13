module LinksHelper
  def render_link_title(title, link)
    link.blank? ?  "未設定" : link_to(title, link)
  end

  def render_link_image(link)
    image_tag(link.thumbnail_url ? link.thumbnail_url : 'noimage.jpg' , style: "vertical-align:middle;")
  end

  def notice_message
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert", :onclick => "document.getElementById('close').style.display='none'") + message, :id => "close", :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
end

SeoHelper.configure do |config|
  config.skip_blank               = false
  config.site_name = Setting.app_name
  config.default_page_description = "在學習的道路上，良師、益友、Google和書本是你得到新知識的管道，知識會慢慢累積在你的腦海裡。但有些東西你會一而再，再而三的使用它，那就是你的工具。這個地方期望你將你常用的工具網站和易忘的知識收集起來，變成你個人不離身的工具箱，隨查即用。"
  config.default_page_keywords    = "工具 網站 幫助 建立 技術 程式"
  config.default_page_image = Setting.domain + Setting.default_logo_url
  config.site_name_formatter  = lambda { |title, site_name|   "#{title} « #{site_name}".html_safe }
  config.pagination_formatter = lambda { |title, page_number| "#{title} - Page No.#{page_number}" }

end
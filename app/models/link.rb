class Link < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => :user_id

  validates :url,:presence => true, :format => URI::regexp(%w(http https))

  scope :recent, order("created_at DESC")
  scope :hot, order("hits DESC")

  after_create :update_info
 
  def update_info
    update_from_embedly
  end
 

  def update_from_embedly
 
    link = self
 
    urls = [url]
    embedly_api = Embedly::API.new(:key => Setting.embedly_key)
    embedly_objs = embedly_api.oembed(:urls => urls)
 
    response_data = embedly_objs[0].marshal_dump
 
    link.title             =  response_data[:title]
    link.link_type         =  response_data[:type]
    link.author_name       =  response_data[:author_name]
    link.author_url        =  response_data[:author_url]
    link.provider_name     =  response_data[:provider_name]
    link.provider_url      =  response_data[:provider_url]
    link.description       =  response_data[:description]
    link.thumbnail_url     =  response_data[:thumbnail_url]
    link.thumbnail_width   =  response_data[:thumbnail_width]
    link.thumbnail_height  =  response_data[:thumbnail_height]
    link.html              =  response_data[:html]
    link.width             =  response_data[:width]
    link.height            =  response_data[:height]
 
    link.save
  end

  def editable_by?(user)
    user && user == author
  end
end
